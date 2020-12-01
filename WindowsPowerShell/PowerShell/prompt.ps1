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

    $path = Convert-Path .
    $gitBranchName = Get-CurrentGitBranch

    $label = ""
    if ($gitBranchName -eq $null) {
        $label = "[ " + $path + " ]" + "`r`n>"
    } else {
        $label = "[ " + $path + " ]" + "`r`n" +
            "on " + $gitBranchName + "`r`n>"
    }

    Write-Host $label -NoNewLine -ForegroundColor $color
    return " "
}
