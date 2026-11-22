# =====================================================================
# SETUP-DUAL-AGENTS.PS1 - Aplica a Arquitetura Dual em Qualquer Projeto
# (Agente Arquiteto no Antigravity 2.0 vs Agente Construtor na IDE)
# =====================================================================

param (
    [string]$ProjectPath = "."
)

$targetPath = Resolve-Path $ProjectPath -ErrorAction SilentlyContinue
if (!$targetPath) {
    Write-Host "Erro: O caminho especificado nao existe: $ProjectPath" -ForegroundColor Red
    exit 1
}

$rulesSource = "$env:USERPROFILE\.gemini\config\rules"
$targetAgents = Join-Path $targetPath ".agents"
$targetRules = Join-Path $targetAgents "rules"

Write-Host "Configurando Arquitetura Dual de Agentes em: $targetPath" -ForegroundColor Cyan

# 1. Garantir que as pastas .agents e .agents/rules existem
if (!(Test-Path $targetRules)) {
    New-Item -ItemType Directory -Path $targetRules -Force | Out-Null
}

# 2. Copiar os novos agentes separados
Copy-Item -Path "$rulesSource\agente-arquiteto.md" -Destination "$targetRules\agente-arquiteto.md" -Force
Copy-Item -Path "$rulesSource\agente-construtor.md" -Destination "$targetRules\agente-construtor.md" -Force
Write-Host " [x] Agente Arquiteto (Antigravity 2.0) instalado em .agents/rules/" -ForegroundColor Green
Write-Host " [x] Agente Construtor (Antigravity IDE) instalado em .agents/rules/" -ForegroundColor Green

# 3. Limpar arquivos legados que causam conflito de identidade
$legacyFiles = @("agente-ls-critical.md", "autonomia-total.md")
foreach ($lf in $legacyFiles) {
    $legacyFilePath = Join-Path $targetRules $lf
    if (Test-Path $legacyFilePath) {
        Remove-Item -Path $legacyFilePath -Force
        Write-Host " [x] Arquivo legado '$lf' removido com sucesso." -ForegroundColor Yellow
    }
}

# 4. Atualizar AGENTS.md e GEMINI.md na raiz do projeto
$agentsContent = "# PROTOCOLO DE AGENTES DUAIS — LS TECNOLOGIA`n`n" +
"Este projeto utiliza a **Arquitetura Dual de Agentes Especialistas**:`n`n" +
"1. **🏛️ AGENTE ARQUITETO (Antigravity 2.0 / App Desktop)**`n" +
"   - Papel: Arquiteto Principal de Software, Auditor de UX/UI, Estratégia e Performance.`n" +
"   - Fronteira: **Read-Only no código da aplicação**. Focado em planejamento e geração de prompt único.`n" +
"   - Regra: `.agents/rules/agente-arquiteto.md``n`n" +
"2. **🔨 AGENTE CONSTRUTOR (Antigravity IDE / VS Code)**`n" +
"   - Papel: Engenheiro Full-Stack Sênior focado na linha de montagem e implementação física.`n" +
"   - Fronteira: **Autonomia Total de Execução de Código** (edição de arquivos, testes, linter e build).`n" +
"   - Regra: `.agents/rules/agente-construtor.md``n"

Set-Content -Path (Join-Path $targetPath "AGENTS.md") -Value $agentsContent -Encoding UTF8
Set-Content -Path (Join-Path $targetPath "GEMINI.md") -Value $agentsContent -Encoding UTF8
Write-Host " [x] AGENTS.md e GEMINI.md atualizados na raiz do projeto." -ForegroundColor Green

Write-Host "`n======================================================" -ForegroundColor Green
Write-Host " PROJETO ATUALIZADO COM SUCESSO PARA O MODELO DUAL!" -ForegroundColor Green
Write-Host "======================================================" -ForegroundColor Green
