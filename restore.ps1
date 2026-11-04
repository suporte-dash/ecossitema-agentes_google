# =====================================================================
# RESTORE.PS1 — Restaura o Ecossistema em uma Nova Máquina ou Novo SSD
# =====================================================================

$repoDir = $PSScriptRoot
$targetGemini = "$env:USERPROFILE\.gemini\config"

Write-Host "📦 Restaurando o ecossistema de agentes nesta maquina..." -ForegroundColor Cyan

if (!(Test-Path "$targetGemini\skills")) { New-Item -ItemType Directory -Path "$targetGemini\skills" -Force | Out-Null }
if (!(Test-Path "$targetGemini\rules")) { New-Item -ItemType Directory -Path "$targetGemini\rules" -Force | Out-Null }

Copy-Item -Path "$repoDir\skills\*" -Destination "$targetGemini\skills" -Recurse -Force
Copy-Item -Path "$repoDir\rules\*" -Destination "$targetGemini\rules" -Recurse -Force

Write-Host "`n✓ SUCESSO TOTAL! Todas as 58+ skills e regras foram restauradas em:" -ForegroundColor Green
Write-Host "$targetGemini" -ForegroundColor White
Write-Host "`nTodos os agentes de IA agora possuem 100% da sua inteligencia original!" -ForegroundColor Yellow
