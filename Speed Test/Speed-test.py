import speedtest
from ping3 import ping
from tabulate import tabulate

def test_speed():
    st = speedtest.Speedtest()
    
    print("Mencari server terbaik...")
    st.get_best_server()
    
    download_speed = st.download() / 1_000_000  # Konversi ke Mbps
    upload_speed = st.upload() / 1_000_000  # Konversi ke Mbps
    
    return download_speed, upload_speed

def test_ping(hostname):
    response_time = ping(hostname)
    return response_time

if __name__ == "__main__":
    download_speed, upload_speed = test_speed()
    ping_time = test_ping("google.com")
    
    table = [
        ["Kecepatan Unduh ",f"{download_speed:.2f} Mbps"],
        ["Kecepatan Unggah ",f"{upload_speed:.2f} Mbps"],
        ["Ping ke google.com ",f"{ping_time:.2f} ms"]
    ]
    
    print(tabulate(table, headers=["Metode", "Hasil"], tablefmt="pretty"))
