
$repos = Get-Content './organization-info.json' | Out-String | ConvertFrom-Json

Set-Location ..

$orgURL = "https://github.com/Med-Park/"

$orgRepoPath = Get-Location

foreach($repo in $repos.repos){

    $repoPath = $orgRepoPath.ToString() + "/" + $repo.Name
    Set-Location $repoPath 

    Write-Host
    Write-Host ========================================================
    Write-Host Updating repository: $repo.Name
    Write-Host ========================================================

    git checkout dev
    git pull
    git checkout master
    git pull
    git checkout dev
    
    Set-Location ..
}

Write-Host
Write-Host ========================================================
Write-Host Done pulling repos
Write-Host ========================================================
Read-Host