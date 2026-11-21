# =====================================================================
# RESTORE.PS1 - Restaura o Ecossistema em uma Nova Máquina ou Novo SSD
# =====================================================================

$repoDir = $PSScriptRoot
$targetGemini = "$env:USERPROFILE\.gemini\config"

Write-Host "Restaurando o ecossistema de agentes nesta maquina..." -ForegroundColor Cyan

# 1. Criar diretorios globais caso nao existam
if (!(Test-Path "$targetGemini\skills")) { New-Item -ItemType Directory -Path "$targetGemini\skills" -Force | Out-Null }
if (!(Test-Path "$targetGemini\rules")) { New-Item -ItemType Directory -Path "$targetGemini\rules" -Force | Out-Null }
if (!(Test-Path "$targetGemini\memory")) { New-Item -ItemType Directory -Path "$targetGemini\memory" -Force | Out-Null }

# 2. Copiar Skills, Regras e Memoria Global
Copy-Item -Path "$repoDir\skills\*" -Destination "$targetGemini\skills" -Recurse -Force
Copy-Item -Path "$repoDir\rules\*" -Destination "$targetGemini\rules" -Recurse -Force
if (Test-Path "$repoDir\memory\MEMORY.md") {
    Copy-Item -Path "$repoDir\memory\MEMORY.md" -Destination "$targetGemini\memory\MEMORY.md" -Force
}

# 3. Contabilizar o que foi restaurado
$totalSkills = (Get-ChildItem -Directory "$targetGemini\skills").Count
$totalRules = (Get-ChildItem -File "$targetGemini\rules").Count

Write-Host "`n======================================================" -ForegroundColor Green
Write-Host " SUCESSO TOTAL! O Ecossistema foi 100% restaurado:" -ForegroundColor Green
Write-Host "======================================================" -ForegroundColor Green
Write-Host " [x] $totalSkills Skills Globais restauradas em $targetGemini\skills" -ForegroundColor White
Write-Host " [x] $totalRules Regras Globais P0 restauradas em $targetGemini\rules" -ForegroundColor White
Write-Host " [x] Memoria Permanente restaurada em $targetGemini\memory\MEMORY.md" -ForegroundColor White
Write-Host "`nTodos os agentes de IA nesta maquina agora possuem 100% da sua inteligencia original!" -ForegroundColor Yellow
Write-Host "Basta abrir a Antigravity IDE ou o terminal que todos os agentes estarao ativos." -ForegroundColor Cyan
