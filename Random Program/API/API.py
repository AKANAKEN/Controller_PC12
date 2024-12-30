import os.path
import google.auth
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from googleapiclient.discovery import build

# Jika mengubah cakupan ini, hapus file token.json
SCOPES = ['https://www.googleapis.com/auth/spreadsheets.readonly']

def main():
    creds = None
    # File token.json menyimpan token akses pengguna dan refresh token
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file(
                'credentials.json', SCOPES)
            creds = flow.run_local_server(port=0)
        # Simpan token untuk digunakan di masa depan
        with open('token.json', 'w') as token:
            token.write(creds.to_json())

    service = build('sheets', 'v4', credentials=creds)
    sheet = service.spreadsheets()

    # Ganti `spreadsheet_id` dengan ID spreadsheet Anda
    spreadsheet_id = 'YOUR_SPREADSHEET_ID'
    range_name = 'Sheet1!A1:D10'
    result = sheet.values().get(spreadsheetId=spreadsheet_id, range=range_name).execute()
    values = result.get('values', [])

    if not values:
        print('Tidak ada data ditemukan.')
    else:
        print('Data dari spreadsheet:')
        for row in values:
            print(row)

if __name__ == '__main__':
    main()
