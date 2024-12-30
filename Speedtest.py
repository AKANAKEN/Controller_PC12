import speedtest

def run_speedtest():
    st = speedtest.Speedtest()

    print("Mendapatkan server terbaik...")
    st.get_best_server()

    print("Mengunduh tes...")
    download_speed = st.download()
    print(f"Kecepatan Unduh: {download_speed / 1_000_000:.2f} Mbps")

    print("Mengunggah tes...")
    upload_speed = st.upload()
    print(f"Kecepatan Unggah: {upload_speed / 1_000_000:.2f} Mbps")

    server_names = []
    st.get_servers(server_names)
    ping = st.results.ping
    print(f"Ping: {ping} ms")

if __name__ == "__main__":
    run_speedtest()
