# pigSkill

`pigSkill` 是一个用于集中维护个人 Agent Skills 的多技能仓库。每个 Skill 都有独立目录，可单独安装；整个仓库也包含 Codex 插件清单和本地 Marketplace 配置。

## 当前 Skills

| Skill | 功能 | 目录 |
|---|---|---|
| `plant-wechat-article-writer` | 将植物研究周报、论文清单和科研素材整理为微信公众号 Markdown 文章 | [`skills/plant-wechat-article-writer`](skills/plant-wechat-article-writer) |

## 安装单个 Skill

在 Codex 中运行：

```text
$skill-installer install https://github.com/Muchmorepig/pigSkill/tree/main/skills/plant-wechat-article-writer
```

安装后如果没有立即出现，重启 Codex。

### 本地脚本安装

Linux、macOS 或 WSL：

```bash
git clone https://github.com/Muchmorepig/pigSkill.git
cd pigSkill
bash scripts/install-codex-skill.sh plant-wechat-article-writer
```

Windows PowerShell：

```powershell
git clone https://github.com/Muchmorepig/pigSkill.git
Set-Location pigSkill
powershell -ExecutionPolicy Bypass -File scripts/install-codex-skill.ps1 plant-wechat-article-writer
```

脚本默认安装到：

```text
$HOME/.agents/skills/<skill-name>/
```

更新已有安装时，Shell 使用 `--force`，PowerShell 使用 `-Force`。

## 作为 Codex 插件 Marketplace 使用

仓库根目录包含：

```text
.codex-plugin/plugin.json
.agents/plugins/marketplace.json
```

在 Codex CLI 中添加 Marketplace：

```bash
codex plugin marketplace add Muchmorepig/pigSkill --ref main
```

然后重启 ChatGPT 桌面应用或 Codex，在 Plugins 中选择 `pigSkill` 并安装 `pig-skill`。

## 使用示例

```text
使用 $plant-wechat-article-writer，把我提供的植物研究周报素材整理成微信公众号文章，并保存为标题.md。
```

## 新增 Skill 约定

以后新增 Skill 时使用：

```text
skills/<kebab-case-name>/
├── SKILL.md
├── README.md             # 推荐
├── agents/
│   └── openai.yaml       # 可选
├── references/           # 可选
├── scripts/              # 可选
└── assets/               # 可选
```

要求：

1. 目录名与 `SKILL.md` frontmatter 中的 `name` 一致。
2. 主文件必须命名为大写 `SKILL.md`。
3. frontmatter 至少包含 `name` 和 `description`。
4. `description` 应明确说明功能和触发场景。
5. 主工作流放在 `SKILL.md`；大段规范、示例和领域参考拆到 `references/`。
6. 每个 Skill 应能独立复制到 `$HOME/.agents/skills/`。
7. 新增 Skill 后更新本 README 中的索引，并递增 `.codex-plugin/plugin.json` 的版本号。
