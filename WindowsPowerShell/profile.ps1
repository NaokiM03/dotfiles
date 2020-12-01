# PowerShell フォルダ配下にある .ps1 ファイルをすべて読み込む処理
$modules = [Environment]::GetFolderPath("MyDocument") + "\WindowsPowerShell\PowerShell\"
cd $modules
ls -r ".\" | ? Extension -eq ".ps1" | % { .$_.FullName }

$privateDotFile = "\dotfiles"
if (Test-Path $privateDotFile) {
    ls -r "\dotfiles" | ? Extension -eq ".ps1" | % { .$_.FullName }
}

# 初期フォルダの初期化
home

function Prompt {
    Get-Prompt
}
