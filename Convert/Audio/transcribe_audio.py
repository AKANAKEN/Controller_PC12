import os
import wave
from pydub import AudioSegment
from vosk import Model, KaldiRecognizer

def normalize_and_split_audio(audio_path, chunk_length_ms=30000):
    """
    Membagi file audio menjadi beberapa bagian kecil dan menormalkan audio.
    """
    audio = AudioSegment.from_file(audio_path)
    # Normalisasi audio ke mono, 16-bit, dan 16kHz
    audio = audio.set_frame_rate(16000).set_channels(1).normalize()
    chunks = []
    for i in range(0, len(audio), chunk_length_ms):
        chunks.append(audio[i:i + chunk_length_ms])
    return chunks

def transcribe_with_vosk(audio_path):
    """
    Transkripsi file audio menggunakan Vosk (offline).
    """
    model_path = "model"  # Pastikan folder model Vosk sudah ada di direktori
    if not os.path.exists(model_path):
        print("Model Vosk tidak ditemukan. Unduh dari https://alphacephei.com/vosk/models")
        return ""

    # Load model Vosk
    model = Model(model_path)
    recognizer = KaldiRecognizer(model, 16000)

    # Buka file WAV
    wf = wave.open(audio_path, "rb")
    if wf.getnchannels() != 1 or wf.getsampwidth() != 2 or wf.getframerate() != 16000:
        print(f"Audio {audio_path} tidak cocok untuk Vosk. Konversi ke mono WAV 16kHz 16-bit.")
        return ""

    # Proses transkripsi
    text = ""
    while True:
        data = wf.readframes(4000)
        if len(data) == 0:
            break
        if recognizer.AcceptWaveform(data):
            result = recognizer.Result()
            text += result
    wf.close()
    return text

def transcribe_audio_to_text(input_folder, output_folder):
    """
    Proses folder input berisi file audio dan transkripsi hasil ke folder output.
    """
    # Periksa apakah folder input ada
    if not os.path.exists(input_folder):
        print(f"Folder input '{input_folder}' tidak ditemukan. Silakan buat folder ini dan tambahkan file audio.")
        return

    # Buat folder output jika belum ada
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Iterasi file di folder input
    for file_name in os.listdir(input_folder):
        file_path = os.path.join(input_folder, file_name)
        output_path = os.path.join(output_folder, f"{os.path.splitext(file_name)[0]}.txt")

        if os.path.isfile(file_path) and file_name.lower().endswith(('.wav', '.mp3')):
            try:
                # Jika file adalah .mp3, konversi ke .wav
                if file_name.lower().endswith('.mp3'):
                    wav_path = os.path.splitext(file_path)[0] + ".wav"
                    audio = AudioSegment.from_mp3(file_path)
                    audio.export(wav_path, format="wav")
                    file_path = wav_path  # Gunakan file WAV untuk transkripsi

                # Bagi audio menjadi beberapa bagian
                print(f"Processing: {file_name}")
                chunks = normalize_and_split_audio(file_path)
                full_text = ""

                for i, chunk in enumerate(chunks):
                    chunk_path = f"chunk_{i}.wav"
                    chunk.export(chunk_path, format="wav")

                    # Transkripsi dengan Vosk
                    text = transcribe_with_vosk(chunk_path)
                    if text:
                        full_text += text
                    else:
                        print(f"Chunk {i} tidak dapat dikenali.")

                    os.remove(chunk_path)  # Hapus file chunk setelah diproses

                # Simpan hasil ke file .txt
                with open(output_path, "w", encoding="utf-8") as output_file:
                    output_file.write(full_text)

                print(f"Saved: {output_path}")

            except Exception as e:
                print(f"Error processing {file_name}: {e}")

if __name__ == "__main__":
    input_folder = "resource_audio"
    output_folder = "output_text"
    transcribe_audio_to_text(input_folder, output_folder)
