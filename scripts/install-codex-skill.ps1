param(
    [string]$SkillName = "plant-wechat-article-writer",
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $PSScriptRoot
$SourceDir = Join-Path $RepoRoot "skills\$SkillName"

if (-not (Test-Path (Join-Path $SourceDir "SKILL.md"))) {
    throw "Skill not found: $SourceDir"
}

if ($env:AGENTS_SKILLS_HOME) {
    $SkillsHome = $env:AGENTS_SKILLS_HOME
} else {
    $SkillsHome = Join-Path $HOME ".agents\skills"
}

$TargetDir = Join-Path $SkillsHome $SkillName

if (Test-Path $TargetDir) {
    if (-not $Force) {
        throw "Target already exists: $TargetDir. Run again with -Force to replace it."
    }
    Remove-Item -Recurse -Force $TargetDir
}

New-Item -ItemType Directory -Force -Path $SkillsHome | Out-Null
Copy-Item -Recurse -Force $SourceDir $TargetDir

Write-Host "Installed $SkillName to $TargetDir"
Write-Host "Restart Codex if the skill does not appear immediately."
