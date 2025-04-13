import os
from yt_dlp import YoutubeDL

def main_menu():
    while True:
        print("=" * 40)
        print("       YouTube Downloader Batch")
        print("=" * 40)
        print()

        # Meminta input nama file dari user
        filename = input("Masukkan nama file (tanpa ekstensi): ").strip()
        if not filename:
            print("Nama file tidak boleh kosong. Silakan coba lagi.")
            continue

        # Meminta input URL dari user
        url = input("Masukkan URL YouTube: ").strip()
        if not url:
            print("URL tidak boleh kosong. Silakan coba lagi.")
            continue

        # Meminta pilihan format dari user
        print("\nPilih format:")
        print("1. Video (MP4, kualitas tertinggi)")
        print("2. Audio (MP3)")
        choice = input("Masukkan pilihan (1 atau 2): ").strip()

        if choice not in ("1", "2"):
            print("Pilihan tidak valid. Silakan coba lagi.")
            continue

        download_folder = os.path.join(os.getcwd(), "Hasil")
        if not os.path.exists(download_folder):
            os.makedirs(download_folder)

        output_template = os.path.join(download_folder, f"{filename}.%(ext)s")

        # Konfigurasi yt-dlp
        ydl_opts = {}
        if choice == "1":
            ydl_opts = {
                "format": "bestvideo+bestaudio/best",
                "outtmpl": output_template,
                "merge_output_format": "mp4",  # Gabungkan video dan audio dalam format MP4
            }
        elif choice == "2":
            ydl_opts = {
                "format": "bestaudio/best",
                "outtmpl": output_template,
                "postprocessors": [
                    {
                        "key": "FFmpegExtractAudio",
                        "preferredcodec": "mp3",
                        "preferredquality": "192",
                    }
                ],
            }

        # Mendownload video/audio
        try:
            print("\nSedang mendownload...")
            with YoutubeDL(ydl_opts) as ydl:
                ydl.download([url])
            print(f"File berhasil diunduh sebagai '{filename}' di folder 'Hasil'.")
        except Exception as e:
            print(f"Terjadi kesalahan: {e}")

        # Menu pilihan setelah download
        print("\nApa yang ingin Anda lakukan selanjutnya?")
        print("1. Download lagi")
        print("2. Keluar")
        next_choice = input("Masukkan pilihan (1 atau 2): ").strip()
        if next_choice == "2":
            break


if __name__ == "__main__":
    main_menu()
