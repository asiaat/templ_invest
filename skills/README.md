# Skills Directory

This directory contains reusable agent skills following the [skills.sh](https://skills.sh) standard.

## What are Skills?

Skills are reusable capabilities for AI agents. They provide procedural knowledge that helps agents accomplish specific tasks more effectively. Think of them as plugins or extensions that enhance what your AI agent can do.

## Standard Format

Each skill is a folder with a `SKILL.md` file:

```yaml
---
name: skill-name
description: Clear description of when to use this skill and when to trigger it
---

# Skill Instructions

[Detailed instructions, examples, and guidelines]
```

## Installing Skills from skills.sh

To add skills from the skills.sh ecosystem:

```bash
# Using npx (recommended)
npx skills add <owner/repo>

# Example: Add PDF skill
npx skills add anthropics/skills/pdf
```

**Note:** The `skills` CLI is from Vercel Labs. Skills are installed to a global location, not into this project.

## Creating Custom Skills

Create a new folder in `skills/` with:

```
skills/
├── my-skill/
│   └── SKILL.md
└── README.md
```

### SKILL.md Template

```yaml
---
name: my-skill-name
description: A clear description of what this skill does and when to use it
---

# My Skill Name

## When to Use This Skill

- Use case 1
- Use case 2

## Instructions

[Detailed instructions for the agent]

## Examples

- Example 1: What to do
- Example 2: What to do

## Guidelines

- Guideline 1
- Guideline 2
```

## Available Skills

### Local Skills (in this directory)

- Add your custom skills here

### External Skills (from skills.sh)

Install using `npx skills add`:

| Skill | Description | Install Command |
|-------|-------------|-----------------|
| pdf | PDF processing (read, create, merge, split) | `npx skills add anthropics/skills/pdf` |
| docx | Word document handling | `npx skills add anthropics/skills/docx` |
| xlsx | Excel/spreadsheet handling | `npx skills add anthropics/skills/xlsx` |
| pptx | PowerPoint presentation handling | `npx skills add anthropics/skills/pptx` |
| webapp-testing | Playwright testing | `npx skills add anthropics/skills/webapp-testing` |
| frontend-design | Frontend UI creation | `npx skills add anthropics/skills/frontend-design` |

## Best Practices

1. **Descriptive triggers**: Write clear descriptions that help the agent know when to use the skill
2. **Include examples**: Show concrete examples of skill usage
3. **Document limitations**: Note any constraints or edge cases
4. **Keep focused**: One skill = one specific capability
5. **Version control**: Track changes to skills over time

## Loading Skills in Agents

In this project, use the `skill` tool to load a skill:

```
Load the [skill-name] skill for this task
```

The agent will load the skill instructions and apply them to the current task.

---

*Following the skills.sh standard from Vercel Labs*
