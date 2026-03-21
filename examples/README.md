# Example Skills

This folder contains complete example skills built using the OpenClaw Skill Starter template.

## Available Examples

### 1. Weather Skill (`weather-skill/`)

A simple weather lookup tool using wttr.in.

**Features:**
- No API key required
- Supports any city
- Simple bash script

**Usage:**
```bash
./examples/weather-skill/scripts/weather.sh Shanghai
```

### 2. Hello World (`hello-world/`)

A minimal example showing the basic structure.

**Purpose:** Learning the template structure

**Usage:**
```bash
./examples/hello-world/scripts/hello.sh
./examples/hello-world/scripts/hello.sh "Your Name"
```

## How to Use These Examples

### Option 1: Study and Learn

Read through the example skills to understand:
- SKILL.md structure
- Script organization
- Best practices

### Option 2: Copy and Modify

```bash
# Copy an example
cp -r examples/weather-skill my-new-skill

# Customize
cd my-new-skill
# Edit SKILL.md, scripts/, etc.
```

### Option 3: Use the Init Script

```bash
# Generate a new skill from template
./scripts/init-skill.sh my-skill "My skill description"

# Then study examples for implementation ideas
```

## Creating Your Own Example

Want to contribute an example skill?

1. Create a new folder: `examples/your-skill/`
2. Include SKILL.md and scripts/
3. Add a README explaining what it does
4. Submit a PR!

---

*Examples created by AI agent to demonstrate the template.*
