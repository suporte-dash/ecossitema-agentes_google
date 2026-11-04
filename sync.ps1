# =====================================================================
# SYNC.PS1 — Sincroniza o Ecossistema Local com o Repositório GitHub
# =====================================================================

$repoDir = $PSScriptRoot
$sourceSkills = "$env:USERPROFILE\.gemini\config\skills"
$sourceRules = "$env:USERPROFILE\.gemini\config\rules"
$sourceMemory = Join-Path (Split-Path $repoDir) "AGENTE FRONT\.agents\memory\MEMORY.md"

Write-Host "🔄 Sincronizando arquivos locais com o repositorio..." -ForegroundColor Cyan

# Copiar skills e regras
if (Test-Path $sourceSkills) {
    Copy-Item -Path $sourceSkills -Destination "$repoDir\skills" -Recurse -Force
    Write-Host "✓ Skills sincronizadas." -ForegroundColor Green
}

if (Test-Path $sourceRules) {
    Copy-Item -Path $sourceRules -Destination "$repoDir\rules" -Recurse -Force
    Write-Host "✓ Regras sincronizadas." -ForegroundColor Green
}

if (Test-Path $sourceMemory) {
    if (!(Test-Path "$repoDir\memory")) { New-Item -ItemType Directory -Path "$repoDir\memory" -Force | Out-Null }
    Copy-Item -Path $sourceMemory -Destination "$repoDir\memory\MEMORY.md" -Force
    Write-Host "✓ Memoria sincronizada." -ForegroundColor Green
}

# Git Commit e Push
Set-Location $repoDir
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
$status = git status --porcelain
if ($status) {
    git commit -m "feat(sync): atualizacao automatica do ecossistema de agentes ($date)"
    git push origin main
    Write-Host "`n🚀 Repositorio GitHub atualizado com sucesso!" -ForegroundColor Yellow
} else {
    Write-Host "`nNenhuma alteracao pendente. Repositorio ja esta 100% atualizado." -ForegroundColor Green
}
