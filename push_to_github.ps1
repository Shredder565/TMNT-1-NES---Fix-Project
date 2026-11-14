# Publish the extracted TMNT NES source project to the user's GitHub repository.
# Prerequisites: Git installed, and GitHub authenticated via Git Credential Manager/SSH.
$ErrorActionPreference = 'Stop'
$repo = 'https://github.com/Shredder565/TMNT-1-NES---Fix-Project.git'
$project = $PSScriptRoot
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) ('tmnt-github-' + [guid]::NewGuid().ToString('N'))
function Check-Git { if ($LASTEXITCODE -ne 0) { throw "Git command failed, exit code $LASTEXITCODE" } }
try {
    git --version
    Check-Git
    git clone $repo $tmp
    Check-Git
    $src = (Resolve-Path $project).Path
    # Copy the project contents, not the git metadata. .gitignore already excludes *.nes.
    Get-ChildItem -LiteralPath $src -Force | Where-Object { $_.Name -ne '.git' } | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $tmp -Recurse -Force
    }
    Push-Location $tmp
    try {
        git add -A
        Check-Git
        git diff --cached --quiet
        $pending = ($LASTEXITCODE -eq 1)
        if ($LASTEXITCODE -gt 1) { throw 'Could not inspect staged changes' }
        if ($pending) {
            git commit -m 'Import NES reverse-engineering source, patches and tests'
            Check-Git
        } else { Write-Host 'No changes to commit.' }
        git branch --show-current
        Check-Git
        # Repository is currently empty. GitHub defaults to main for new repositories.
        git branch -M main
        Check-Git
        git push -u origin main
        Check-Git
        Write-Host 'Published to:' $repo
    } finally { Pop-Location }
} finally { if (Test-Path $tmp) { Remove-Item -LiteralPath $tmp -Recurse -Force } }
