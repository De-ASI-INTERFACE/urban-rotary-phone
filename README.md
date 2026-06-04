# 🔧 urban-rotary-phone — De-ASI-INTERFACE Git Hooks & Dev Tooling

**Creator:** Richard Patterson ([@De-ASI-INTERFACE](https://github.com/De-ASI-INTERFACE))  
**Purpose:** Shared git hooks, pre-commit guards, deployment scripts, and dev automation for the entire De-ASI-INTERFACE ecosystem.

---

## What This Repo Does

Provides production-grade shell scripts and git hooks used across all De-ASI-INTERFACE repositories:

- Pre-commit secret scanning
- Automated lint checks before push
- Deployment helpers for Solana and Next.js services
- Health check runners
- Branch protection enforcement

---

## Structure

```
urban-rotary-phone/
├── hooks/               Git hook scripts (symlink into .git/hooks)
│   ├── pre-commit         Blocks commits with hardcoded secrets
│   ├── pre-push           Runs lint before push
│   └── commit-msg         Enforces commit message format
├── scripts/
│   ├── install_hooks.sh   Installs hooks into any repo
│   ├── deploy_nextjs.sh   Build + deploy Next.js site
│   ├── deploy_python.sh   Install deps + start FastAPI service
└──   └── health_check.sh    Ping all ecosystem endpoints
```

---

## Install Hooks Into Any Repo

```bash
bash scripts/install_hooks.sh /path/to/your/repo
```

---

*Powered by De-ASI-INTERFACE · Built in Akron, Ohio*
