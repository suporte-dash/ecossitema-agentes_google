# =====================================================================
# SYNC.PS1 - Sincroniza o Ecossistema Local com o Repositorio GitHub
# =====================================================================

$repoDir = $PSScriptRoot
$sourceSkills = "$env:USERPROFILE\.gemini\config\skills"
$sourceRules = "$env:USERPROFILE\.gemini\config\rules"
$sourceWorkspace = Join-Path (Split-Path $repoDir) "AGENTE FRONT"
$sourceMemory = Join-Path $sourceWorkspace ".agents\memory\MEMORY.md"

Write-Host "Sincronizando arquivos locais com o repositorio..." -ForegroundColor Cyan

# 1. Copiar Skills
if (Test-Path $sourceSkills) {
    if (!(Test-Path "$repoDir\skills")) { New-Item -ItemType Directory -Path "$repoDir\skills" -Force | Out-Null }
    Copy-Item -Path "$sourceSkills\*" -Destination "$repoDir\skills" -Recurse -Force
    Write-Host "Skills sincronizadas com sucesso." -ForegroundColor Green
}

# 2. Copiar Regras
if (Test-Path $sourceRules) {
    if (!(Test-Path "$repoDir\rules")) { New-Item -ItemType Directory -Path "$repoDir\rules" -Force | Out-Null }
    Copy-Item -Path "$sourceRules\*" -Destination "$repoDir\rules" -Recurse -Force
    Write-Host "Regras sincronizadas com sucesso." -ForegroundColor Green
}

# 3. Copiar Memoria
if (Test-Path $sourceMemory) {
    if (!(Test-Path "$repoDir\memory")) { New-Item -ItemType Directory -Path "$repoDir\memory" -Force | Out-Null }
    Copy-Item -Path $sourceMemory -Destination "$repoDir\memory\MEMORY.md" -Force
    Write-Host "Memoria sincronizada com sucesso." -ForegroundColor Green
}

# 4. Copiar Documentos Estrategicos do Workspace
if (Test-Path $sourceWorkspace) {
    if (!(Test-Path "$repoDir\docs")) { New-Item -ItemType Directory -Path "$repoDir\docs" -Force | Out-Null }
    $docFiles = @(
        "FORMULARIO_BRIEFING_CLIENTE_LS_DIGITAL.md",
        "GUIA_CONSTRUCAO_SITES_LS_DIGITAL.md",
        "MANUAL_DO_VENDEDOR_LS_DIGITAL.md",
        "PLANO_DE_ACAO_PROSPECCAO_CLIENTES.md",
        "PROPOSTA_SOCIEDADE_E_PARCERIA_LS.md",
        "CATALOGO_SERVICOS_E_PARCERIA_LS.md",
        "PROJECT_STATE.md"
    )
    foreach ($doc in $docFiles) {
        $docPath = Join-Path $sourceWorkspace $doc
        if (Test-Path $docPath) {
            Copy-Item -Path $docPath -Destination "$repoDir\docs\$doc" -Force
        }
    }
    Write-Host "Documentos de negocios sincronizados com sucesso." -ForegroundColor Green
}

# 5. Git Commit e Push
Set-Location $repoDir
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
$status = git status --porcelain
if ($status) {
    git commit -m "feat(sync): atualizacao completa do ecossistema de agentes ($date)"
    git push origin main
    Write-Host "`nRepositorio GitHub atualizado com sucesso!" -ForegroundColor Yellow
} else {
    Write-Host "`nNenhuma alteracao pendente. Repositorio ja esta 100% atualizado." -ForegroundColor Green
}
