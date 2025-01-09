import torch
import torchaudio
from transformers import Wav2Vec2ForCTC, Wav2Vec2Processor

# Muat processor dan model
processor = Wav2Vec2Processor.from_pretrained("indonesian-nlp/wav2vec2-large-xlsr-indonesian")
model = Wav2Vec2ForCTC.from_pretrained("indonesian-nlp/wav2vec2-large-xlsr-indonesian")

# Muat file audio
waveform, sample_rate = torchaudio.load("converted_audio.wav")

# Jika sample rate bukan 16kHz, lakukan resampling
if sample_rate != 16000:
    resampler = torchaudio.transforms.Resample(orig_freq=sample_rate, new_freq=16000)
    waveform = resampler(waveform)

# Normalisasi
waveform = waveform.squeeze().numpy()

# Tokenisasi
inputs = processor(waveform, sampling_rate=16000, return_tensors="pt", padding=True)

# Prediksi
with torch.no_grad():
    logits = model(**inputs).logits

# Ambil prediksi dengan probabilitas tertinggi
predicted_ids = torch.argmax(logits, dim=-1)

# Konversi menjadi teks
transcription = processor.batch_decode(predicted_ids)
print("Transkripsi:", transcription[0])
