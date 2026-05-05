param(
    [int]$Port = 8501
)

$ErrorActionPreference = "Stop"

Write-Host "== Omni-Asset Quant Terminal Bootstrap =="
Write-Host "Project: $(Get-Location)"

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    throw "Python is not installed or not in PATH."
}

$pyVersion = python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"
Write-Host "Python version: $pyVersion"

if (-not (Test-Path ".venv")) {
    Write-Host "Creating virtual environment (.venv)..."
    python -m venv .venv
}

Write-Host "Activating virtual environment..."
. .\.venv\Scripts\Activate.ps1

Write-Host "Upgrading pip..."
python -m pip install --upgrade pip

Write-Host "Installing dependencies..."
pip install -r requirements.txt

Write-Host "Launching Streamlit on port $Port ..."
python -m streamlit run app.py --server.port $Port
