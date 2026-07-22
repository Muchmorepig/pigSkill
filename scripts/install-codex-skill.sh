#!/usr/bin/env bash
set -euo pipefail

skill_name="${1:-plant-wechat-article-writer}"
force="${2:-}"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source_dir="${repo_root}/skills/${skill_name}"
skills_home="${AGENTS_SKILLS_HOME:-${HOME}/.agents/skills}"
target_dir="${skills_home}/${skill_name}"

if [[ ! -f "${source_dir}/SKILL.md" ]]; then
  echo "Skill not found: ${source_dir}" >&2
  exit 1
fi

if [[ -e "${target_dir}" ]]; then
  if [[ "${force}" != "--force" ]]; then
    echo "Target already exists: ${target_dir}" >&2
    echo "Run again with --force to replace it." >&2
    exit 2
  fi
  rm -rf "${target_dir}"
fi

mkdir -p "${skills_home}"
cp -R "${source_dir}" "${target_dir}"

echo "Installed ${skill_name} to ${target_dir}"
echo "Restart Codex if the skill does not appear immediately."
