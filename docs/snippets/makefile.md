# Makefile

## Python environments

```makefile
.PHONY=default env clean

.DEFAULT_GOAL=default

PY=python3

PY_ENV=.venv/bin/python3
PIP_ENV=.venv/bin/pip3

default:
	@echo "Please select a valid target"

env:
	@test -d .venv || echo "Create .venv" && $(PY) -m venv .venv && $(PIP_ENV) install wheel
	@echo "Installing packages" && $(PIP_ENV) install -r requirements.txt

clean:
	rm -rf .venv

```