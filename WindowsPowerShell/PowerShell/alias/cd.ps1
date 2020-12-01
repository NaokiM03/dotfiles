function .. { cd .. }
function ... { cd .. ; cd .. }
function .... { cd .. ; cd .. ; cd .. }
function \ { cd \ }
function home { cd $env:USERPROFILE }
function desk { cd ([Environment]::GetFolderPath("DesktopDirectory")) }
function doc { cd ([Environment]::GetFolderPath("MyDocument")) }
function pic { cd ([Environment]::GetFolderPath("MyPictures")) }
function down { cd ($env:USERPROFILE + "\Downloads") }
function bin { cd "\bin" }
function lib { cd "\lib" }
function gh { cd "\github" }
function lab { cd "\gitlab" }
