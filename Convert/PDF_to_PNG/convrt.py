import os
import fitz  # PyMuPDF

# Folder input dan output
input_folder = "input"
output_folder = "output"

# Membuat folder output jika belum ada
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Fungsi untuk mengonversi PDF ke PNG dengan kualitas tinggi
def pdf_to_png(input_folder, output_folder, dpi=300):
    # Mendapatkan semua file PDF di folder input
    pdf_files = [f for f in os.listdir(input_folder) if f.lower().endswith(".pdf")]
    
    if not pdf_files:
        print("Tidak ada file PDF di folder input.")
        return
    
    for pdf_file in pdf_files:
        pdf_path = os.path.join(input_folder, pdf_file)
        document = fitz.open(pdf_path)
        pdf_name = os.path.splitext(pdf_file)[0]

        print(f"Memproses file: {pdf_file}")

        # Memproses setiap halaman dalam PDF
        for page_number in range(len(document)):
            page = document.load_page(page_number)
            # Meningkatkan resolusi output dengan DPI
            pix = page.get_pixmap(dpi=dpi)
            
            # Nama file PNG berdasarkan nama PDF dan nomor halaman
            output_file = os.path.join(output_folder, f"{pdf_name}_page_{page_number + 1}.png")
            pix.save(output_file)

        document.close()
        print(f"File {pdf_file} selesai diproses.")

# Menjalankan fungsi
pdf_to_png(input_folder, output_folder, dpi=300)  # Resolusi 300 DPI
print("Konversi selesai.")
