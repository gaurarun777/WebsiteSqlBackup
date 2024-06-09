sqlcmd -S ServerName -U sa -P Sitecore@123 -v path = "'C:\Personal\backup\'" -i "website backup.sql"
"C:\Program Files\7-Zip\7z.exe" a -tzip "C:\Personal\backup\DB_%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%.zip" "C:\Personal\backup\sc93local_*.bak"
del "C:\Personal\backup\sc93local_*.bak"

@pause
PowerShell -File "C:\Personal\Tricks\website backup with exclude folder.ps1"

@pause
