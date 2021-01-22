.PHONY: env evil-push push deploy clean evil-clean

.DEFAULT_GOAL=default

PY=python3

PY_ENV=.venv/bin/python3
PIP_ENV=.venv/bin/pip3

MKDOCS=.venv/bin/mkdocs
GHP=.venv/bin/ghp-import

default:
	@echo "Please select a valid target"


env:
	@test -d .venv || $(PY) -m venv .venv && $(PIP_ENV) install wheel
	$(PIP_ENV) install -r requirements.txt


evil-push:
	rm -rf .git
	git init
	git checkout -b main
	git add .
	git commit -m "Initial commit"
	git remote add origin https://github.com/albert-rz/fiveam.git
	git push -u --force origin main


push:
	git add .
	git commit -am "Update"
	git push


deploy:
	mkdocs gh-deploy --force


serve:
	$(MKDOCS) serve


deploy:
	$(MKDOCS) build
	$(PY) -m html_pprint
	$(GHP) -f -p site/


clean:
	rm -rf __pycache__ site


evil-clean: clean
	rm -rf .bak.git


