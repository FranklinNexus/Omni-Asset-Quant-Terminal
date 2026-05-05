# Contributing Guide

Thanks for contributing to the Multi-Asset VA & Macro Alpha Terminal.

## Development Setup

1. Clone repo
2. Create virtual env
3. Install dependencies
4. Run checks

```bash
python -m venv .venv
# Windows
.venv\Scripts\activate
# macOS/Linux
source .venv/bin/activate

python -m pip install --upgrade pip
pip install -r requirements-dev.txt
python -m streamlit run app.py
```

## Quality Checks

Before opening a PR, run:

```bash
python -m ruff check .
python -m py_compile app.py
python -m pytest -q
```

## Branch & PR Rules

- Create feature branches from `main`
- Keep PRs focused and small
- Use clear commit messages (what + why)
- Include screenshots/GIF for UI changes
- Add/adjust tests for logic changes

## Code Style

- Follow readable, modular Python style
- Prefer pure functions for quant calculations
- Keep Streamlit UI logic separate from core math where possible
- Avoid breaking ledger file schema unless migration steps are provided

## Reporting Bugs

Please include:
- OS + Python version
- Exact command used
- Error logs
- Minimal reproduction steps
- If relevant, sample input file (CSV/XLSX)

## Security

Do not commit secrets, API keys, or private account files.
Use `.env` and provide only `.env.example` when needed.
