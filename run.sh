#!/usr/bin/env bash
set -euo pipefail

PORT="${1:-8501}"

echo "== Omni-Asset Quant Terminal Bootstrap =="
echo "Project: $(pwd)"

if ! command -v python3 >/dev/null 2>&1; then
  echo "python3 not found in PATH" >&2
  exit 1
fi

if [ ! -d ".venv" ]; then
  echo "Creating virtual environment (.venv)..."
  python3 -m venv .venv
fi

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Upgrading pip..."
python -m pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Launching Streamlit on port ${PORT} ..."
python -m streamlit run app.py --server.port "${PORT}"
