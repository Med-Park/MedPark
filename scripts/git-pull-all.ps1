
$repos = Get-Content './organization-info.json' | Out-String | ConvertFrom-Json

Set-Location ..

$orgURL = "https://github.com/Med-Park/"

$repoPath = Get-Location

foreach($repo in $repos.repos){

    $repoPath = $repoPath.ToString() + "/" + $repo.Name

    Write-Host
    Write-Host ========================================================
    Write-Host Updating repository: $repo.Name
    Write-Host ========================================================

    Set-Location $repoPath

    git checkout dev
    git pull
    git checkout master
    git pull
    git checkout dev
    
    $repoPath = Get-Location
    Set-Location ..
}

Write-Host
Write-Host ========================================================
Write-Host Done pulling repos
Write-Host ========================================================
Read-Host