# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

probe-_doe is an OSINT (Open Source Intelligence) agentic framework that orchestrates data collection, processing, and analysis workflows. It implements a 3-layer architecture separating directives (instructions), orchestration (AI decision-making), and execution (deterministic Python scripts).

## Commands

```bash
# Run the news fetcher
python execution/fetch_news.py --output-dir .tmp

# Check today's execution logs
tail -f logs/exec_$(date +%Y%m%d).log

# Validate JSON output
python -m json.tool .tmp/news_vulkangruppe*.json
```

## Architecture

**3-Layer System:**
1. **Directives** (`directives/`) - Markdown SOPs defining goals, inputs, tools, outputs, edge cases
2. **Orchestration** (AI) - Read directives, call execution tools, handle errors, update directives with learnings
3. **Execution** (`execution/`) - Deterministic Python scripts for API calls, data processing, file operations

**Why:** LLMs are probabilistic; business logic needs consistency. 90% accuracy per step = 59% success over 5 steps. Push complexity into deterministic code.

## Directory Structure

- `directives/` - Operating procedures (SOPs) in Markdown
- `execution/` - Python scripts (deterministic tools)
- `skills/` - Agent skills following skills.sh standard
- `logs/` - Daily execution logs (`exec_YYYYMMDD.log`)
- `reports/` - OSINT investigation outputs (`YYYYMMDD_HHMMSS_<target>/`)
- `.tmp/` - Intermediate files (git-ignored, always regenerated)
- `.env` - API keys and credentials

## Key Operating Principles

1. **Check `execution/` for existing tools before creating new scripts**
2. **Self-anneal on errors:** Fix script → Test → Update directive with learnings
3. **Log all tool executions** to `logs/exec_YYYYMMDD.log` with: timestamp, tool name, params, status, errors
4. **Deliverables in cloud** (Google Sheets/Slides), local files are temporary
5. **Directives are living documents** - update with API constraints, better approaches, edge cases

## Using Agents

This project supports agent delegation for complex multi-step tasks. Use the `task` tool to launch sub-agents:

**Available Agent Types:**
- `general` - General-purpose agent for multi-step tasks and research
- `explore` - Fast agent specialized for exploring codebases, finding files, and searching code

**When to Use Agents:**
- Parallel research across multiple topics
- Complex multi-step tasks that can be broken down
- Exploring large codebases for specific patterns
- Delegating independent subtasks that can run concurrently

**Usage:**
```
Use the task tool to launch an agent with:
- description: Short task description
- prompt: Detailed instructions for the agent
- subagent_type: "general" or "explore"
```

## Using Skills (skills.sh Standard)

This project follows the [skills.sh](https://skills.sh) standard for agent skills. Skills are reusable capabilities that provide procedural knowledge to agents.

**Directory:** `skills/` - Contains custom skills following the skills.sh format

**Skill Format:**
```yaml
---
name: skill-name
description: Clear description of when to use this skill
---

# Skill Instructions
```

**Installing External Skills:**
```bash
# Using npx (from Vercel Labs)
npx skills add <owner/repo>

# Examples:
npx skills add anthropics/skills/pdf
npx skills add anthropics/skills/docx
npx skills add anthropics/skills/xlsx
```

**Loading Skills in Sessions:**
When a task requires a specific skill (PDF processing, document creation, etc.), load the skill using the `skill` tool. This provides the agent with detailed procedural knowledge for that domain.

**Creating Custom Skills:**
Create `skills/<skill-name>/SKILL.md` following the format above. See `skills/README.md` for detailed guidelines.

## Environment Variables

Required in `.env` (see `.env.example`):
- `NEWS_API_KEY` - EventRegistry API key for fetch_news.py
- `TELEGRAM_*` - Telegram API credentials
- `STRAVA_*` - Strava API credentials

## Dependencies

Python with `requests` package. No formal requirements.txt - install manually as needed.
