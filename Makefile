.PHONY: venv push evil-push deploy clean
.DEFAULT_GOAL= := help


PYTHON=.venv/bin/python3
PIP=.venv/bin/pip3

MKDOCS=.venv/bin/mkdocs
GHP=.venv/bin/ghp-import


define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT


help:
	@python3 -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

venv: ## make Python virtual environment
	@test -d .venv || python3 -m venv .venv && $(PIP) install wheel
	$(PIP) install -r requirements.txt

push: ## commit and push changes
	git add .
	git commit -am "Update"
	git push

# evil-push:
# 	rm -rf .git
# 	git init
# 	git checkout -b main
# 	git add .
# 	git commit -m "Initial commit"
# 	git remote add origin https://github.com/albert-rz/fiveam.git
# 	git push -u --force origin main

serve: ## start the MkDocs server
	$(MKDOCS) serve

deploy: ## deploy static website to GitHub pages
	$(MKDOCS) build
	$(PYTHON) -m html_pprint
	$(GHP) -f -p site/

clean: ## remove Python file artifacts and site
	rm -rf __pycache__ site
