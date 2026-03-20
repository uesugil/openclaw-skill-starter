# 🛠️ OpenClaw Skill Starter

[![Stars](https://img.shields.io/github/stars/uesugil/openclaw-skill-starter?style=flat-square)](https://github.com/uesugil/openclaw-skill-starter/stargazers)
[![Forks](https://img.shields.io/github/forks/uesugil/openclaw-skill-starter?style=flat-square)](https://github.com/uesugil/openclaw-skill-starter/network/members)
[![License](https://img.shields.io/github/license/uesugil/openclaw-skill-starter?style=flat-square)](LICENSE)
[![Last Commit](https://img.shields.io/github/last-commit/uesugil/openclaw-skill-starter?style=flat-square)](https://github.com/uesugil/openclaw-skill-starter/commits/main)

> **Template for creating OpenClaw agent skills quickly**

A boilerplate and development kit for building OpenClaw skills. Includes project structure, best practices, and example implementations.

## 🚀 Quick Start

### Create a New Skill

```bash
# Clone this template
git clone https://github.com/uesugil/openclaw-skill-starter.git my-new-skill
cd my-new-skill

# Rename and customize
./scripts/init-skill.sh my-skill-name "My Skill Description"
```

### Or Manual Setup

1. Copy the `template/` folder to your workspace
2. Rename files and update metadata
3. Implement your skill logic in `scripts/`
4. Write documentation in `docs/`
5. Test and publish

## 📁 Project Structure

```
my-skill/
├── SKILL.md              # Skill metadata and description (required)
├── README.md             # User-facing documentation
├── scripts/
│   ├── main.sh           # Main skill script
│   └── helpers/          # Helper utilities
├── docs/
│   ├── USAGE.md          # Detailed usage guide
│   └── EXAMPLES.md       # Usage examples
├── examples/             # Example outputs and demos
└── tests/                # Test scripts (optional)
```

## 📝 SKILL.md Template

```markdown
# Skill Name

**Description:** One-line description of what this skill does

**Usage:** /skill-name [arguments]

**When to use:**
- Scenario 1
- Scenario 2

**NOT for:**
- What not to use it for

**Dependencies:**
- Required tools or APIs
```

## 🔧 Development Guidelines

### 1. Keep It Focused

Each skill should do **one thing well**. Don't build swiss army knives.

### 2. Follow OpenClaw Conventions

- Use `scripts/` for executable code
- Document in `docs/`
- Provide examples in `examples/`

### 3. Error Handling

```bash
#!/bin/bash
set -e  # Exit on error

# Check for required tools
if ! command -v jq &> /dev/null; then
    echo "Error: jq is required but not installed"
    exit 1
fi
```

### 4. User Feedback

Always provide clear feedback:
- ✅ Success messages
- ❌ Error messages with helpful suggestions
- 📊 Progress indicators for long operations

## 📦 Example Skills

See `examples/` for complete skill implementations:

- `weather-skill` - Get weather forecasts
- `github-skill` - GitHub operations via gh CLI
- `memory-skill` - Local memory management

## 🧪 Testing

```bash
# Run skill with test input
./scripts/main.sh --test

# Check output format
./scripts/main.sh --validate
```

## 📤 Publishing

### To ClawHub

```bash
# Install clawhub CLI
npm install -g clawhub

# Publish your skill
clawhub publish ./my-skill
```

### To GitHub

```bash
git init
git add -A
git commit -m "Initial release: my-skill v1.0"
gh repo create my-skill --public --source=. --push
```

## 🤝 Contributing

Found a bug? Have an improvement? Open an issue or PR!

## 📄 License

MIT License

---

**Built for the OpenClaw ecosystem** 🦾

**Template by:** https://github.com/uesugil/openclaw-skill-starter
