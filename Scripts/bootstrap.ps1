$myDocumentsPath = [Environment]::GetFolderPath("MyDocument")
Copy-Item -LiteralPath ".\WindowsPowerShell" -Destination $myDocumentsPath -Recurse -Force

New-Item -ItemType Directory -Force -Path "\bin" | Out-Null
New-Item -ItemType Directory -Force -Path "\lib" | Out-Null
