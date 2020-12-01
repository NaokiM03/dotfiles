function Get-PromptColor {
    if ($?) {
        return "Green"
    } else {
        return "Red"
    }
}

function Get-CurrentGitBranch {
    git branch 2>$null |
        ? { [bool]($_.Split()[0]) } |
        % { $branchName = $_.Split()[1]; Write-Output "$branchName" }
}

function Get-Prompt {
    $color = Get-PromptColor

    $currentPath = Convert-Path .
    $splitedCurrentPath = $currentPath.split("\")

    $str = ""

    if ($splitedCurrentPath[1] -eq "Users") {
        if ($splitedCurrentPath.length -eq 3) {
            $str = "[ " + $splitedCurrentPath[2] + " ]"
        } elseif ($splitedCurrentPath.length -eq 4) {
            if ($splitedCurrentPath[3] -eq "Desktop" -or
                    $splitedCurrentPath[3] -eq "Documents" -or
                    $splitedCurrentPath[3] -eq "Pictures" -or
                    $splitedCurrentPath[3] -eq "Downloads") {
                $str = "[ " + $splitedCurrentPath[3] + " ]"
            }
        }
    } elseif ($splitedCurrentPath[1] -eq "bin" -and $splitedCurrentPath.length -eq 2) {
        $str = "[ " + $splitedCurrentPath[1] + " ]"
    } elseif ($splitedCurrentPath[1] -eq "lib") {
        if ($splitedCurrentPath.length -eq 2) {
            $str = "[ " + $splitedCurrentPath[1] + " ]"
        } else {
            $splitedCurrentPath = $splitedCurrentPath[1..($splitedCurrentPath.length - 1)]
            $str = "[ " + ($splitedCurrentPath -join "\") + " ]"
        }
    } elseif ($splitedCurrentPath[1] -eq "github" -or $splitedCurrentPath[1] -eq "gitlab") {
        if ($splitedCurrentPath.length -eq 2) {
            $str = "[ " + $splitedCurrentPath[1] + " ]"
        } else {
            $path = $splitedCurrentPath[1..($splitedCurrentPath.length - 1)]
            $gitBranchName = Get-CurrentGitBranch
            $str = "[ " + ($path -join "\") + " ] on " + $gitBranchName
        }
    }

    if ($str -eq "") {
        $str = "[ " + $currentPath + " ]"
    }

    Write-Host ($str + "`r`n>") -NoNewLine -ForegroundColor $color
    return " "
}
