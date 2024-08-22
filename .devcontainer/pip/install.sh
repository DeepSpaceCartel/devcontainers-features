python3 -m venv .venv
source .venv/bin/activate
pip install pre-commit
pre-commit sample-config > .pre-commit-config.yaml
pre-commit install
pre-commit run --all-files
