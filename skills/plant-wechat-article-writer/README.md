# plant-wechat-article-writer

将植物研究周报、论文清单、方法工具介绍和零散科研素材整理为适合微信公众号发布的中文 Markdown 文章。

## 安装到 Codex

在 Codex 中运行：

```text
$skill-installer install https://github.com/Muchmorepig/pigSkill/tree/main/skills/plant-wechat-article-writer
```

安装后如果没有立即出现，重启 Codex。

也可以手动复制整个目录到：

```text
$HOME/.agents/skills/plant-wechat-article-writer/
```

不要只复制 `SKILL.md`，因为该 Skill 还会按需读取 `references/`。

## 使用

```text
使用 $plant-wechat-article-writer，把这些植物研究周报素材整理成公众号文章，并保存为标题.md。
```

也可以直接提出匹配任务，由 Codex 根据 Skill 的 `description` 隐式调用。
