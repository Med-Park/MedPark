
$repos = Get-Content './organization-info.json' | Out-String | ConvertFrom-Json

Set-Location ..

$orgURL = "https://github.com/Med-Park/"

$orgRepoPath = Get-Location

foreach($repo in $repos.repos){

    $repoPath = $orgRepoPath.ToString() + "/" + $repo.Name
    Set-Location $repoPath 

    Write-Host ========================================================
    Write-Host Validate $repo.Name if all chnages have been commited...
    Write-Host ========================================================

    $status = git status --short
    
    Write-Host $status

    Write-Host
    Write-Host

    if($status){

        Write-Host ======================================================== -ForegroundColor Red
        Write-Host Please commit your changes for $repo.Name before pushing. -ForegroundColor Red
        Write-Host ======================================================== -ForegroundColor Red

        break
    }
    else{

        $curentBranch = git rev-parse --abbrev-ref HEAD

        git push origin $curentBranch
    }

    Set-Location ..
    Write-Host
    Write-Host
}

Write-Host
Write-Host ========================================================
Write-Host Done pushing repos
Write-Host ========================================================
Read-Host