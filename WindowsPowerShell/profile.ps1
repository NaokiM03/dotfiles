# PowerShell フォルダ配下にある .ps1 ファイルをすべて読み込む処理
$libDirectory = [Environment]::GetFolderPath("MyDocument") + "\WindowsPowerShell\PowerShell\"
cd $libDirectory
ls -r ".\" | ? Extension -eq ".ps1" | % { .$_.FullName }

# 初期フォルダの初期化
home

function Prompt {
    Get-Prompt
}
