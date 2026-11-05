# =====================================================================
# SYNC.PS1 - Sincroniza o Ecossistema Local com o Repositorio GitHub
# =====================================================================

$repoDir = $PSScriptRoot
$sourceSkills = "$env:USERPROFILE\.gemini\config\skills"
$sourceRules = "$env:USERPROFILE\.gemini\config\rules"
$sourceMemory = Join-Path (Split-Path $repoDir) "AGENTE FRONT\.agents\memory\MEMORY.md"

Write-Host "Sincronizando arquivos locais com o repositorio..." -ForegroundColor Cyan

# Copiar skills e regras
if (Test-Path $sourceSkills) {
    if (!(Test-Path "$repoDir\skills")) { New-Item -ItemType Directory -Path "$repoDir\skills" -Force | Out-Null }
    Copy-Item -Path "$sourceSkills\*" -Destination "$repoDir\skills" -Recurse -Force
    Write-Host "Skills sincronizadas com sucesso." -ForegroundColor Green
}

if (Test-Path $sourceRules) {
    if (!(Test-Path "$repoDir\rules")) { New-Item -ItemType Directory -Path "$repoDir\rules" -Force | Out-Null }
    Copy-Item -Path "$sourceRules\*" -Destination "$repoDir\rules" -Recurse -Force
    Write-Host "Regras sincronizadas com sucesso." -ForegroundColor Green
}

if (Test-Path $sourceMemory) {
    if (!(Test-Path "$repoDir\memory")) { New-Item -ItemType Directory -Path "$repoDir\memory" -Force | Out-Null }
    Copy-Item -Path $sourceMemory -Destination "$repoDir\memory\MEMORY.md" -Force
    Write-Host "Memoria sincronizada com sucesso." -ForegroundColor Green
}

# Git Commit e Push
Set-Location $repoDir
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
$status = git status --porcelain
if ($status) {
    git commit -m "feat(sync): atualizacao automatica do ecossistema de agentes ($date)"
    git push origin main
    Write-Host "Repositorio GitHub atualizado com sucesso!" -ForegroundColor Yellow
} else {
    Write-Host "Nenhuma alteracao pendente. Repositorio ja esta 100% atualizado." -ForegroundColor Green
}
