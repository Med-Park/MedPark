
$repos = Get-Content './organization-info.json' | Out-String | ConvertFrom-Json

Set-Location ..

$orgURL = "https://github.com/Med-Park/"

$repoPath = Get-Location

foreach($repo in $repos.repos){

    $repoPath = $repoPath.ToString() + "/" + $repo.Name

    if(![System.IO.File]::Exists($repoPath)){
        Write-Host
        Write-Host ========================================================
        Write-Host Respository ($repo.Name) already exists. Please pull to get latest changes
        Write-Host
        Write-Host ======================================================== 
    }
    else{
        $repoURL = $orgURL + $repo.Name + ".git"

        Write-Host
        Write-Host ========================================================
        Write-Host Cloning repository: $repo.Name
        Write-Host ========================================================
    
        git clone $repoURL
    }
}

Write-Host
Write-Host ========================================================
Write-Host Done clonging repos
Write-Host ========================================================
Read-Host