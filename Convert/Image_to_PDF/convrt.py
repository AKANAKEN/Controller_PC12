import os
from PIL import Image
from reportlab.pdfgen import canvas

# Folder input dan output
input_folder = "input"  # Folder input untuk gambar
output_folder = "output"  # Folder output untuk PDF

# Membuat folder output jika belum ada
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Fungsi untuk mengonversi gambar ke satu PDF dengan kualitas tinggi
def images_to_pdf(input_folder, output_folder):
    # Mendapatkan semua file gambar di folder input
    image_files = [f for f in os.listdir(input_folder) if f.lower().endswith(('.png', '.jpg', '.jpeg'))]
    
    if not image_files:
        print("Tidak ada file gambar di folder input.")
        return
    
    # Nama file PDF output
    pdf_path = os.path.join(output_folder, "output.pdf")
    
    print(f"Membuat file PDF: {pdf_path}")

    # Membuat PDF
    c = canvas.Canvas(pdf_path)

    for image_file in image_files:
        image_path = os.path.join(input_folder, image_file)
        print(f"Memproses file: {image_file}")

        # Membuka gambar
        img = Image.open(image_path)
        width, height = img.size

        # Mengatur ukuran halaman PDF sesuai dengan ukuran gambar
        c.setPageSize((width, height))
        
        # Menambahkan gambar ke PDF
        c.drawImage(image_path, 0, 0, width, height)
        c.showPage()  # Menyelesaikan halaman

    c.save()  # Menyimpan PDF
    print(f"File {pdf_path} selesai diproses.")

# Menjalankan fungsi
images_to_pdf(input_folder, output_folder)
print("Konversi selesai.")