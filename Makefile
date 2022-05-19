#
# vim:ft=make
# Makefile
#
.DEFAULT_GOAL := help
.PHONY: test help


help:  ## these help instructions
	@sed -rn 's/^([a-zA-Z_-]+):.*?## (.*)$$/"\1" "\2"/p' < $(MAKEFILE_LIST)|xargs printf "make %-20s# %s\n"

hidden: # example undocumented, for internal usage only
	@true

pydoc: ## Run a pydoc server and open the browser
	poetry run python -m pydoc -b

install: ## Run `poetry install`
	poetry install

showdeps: ## run poetry to show deps
	@echo "CURRENT:"
	poetry show --tree
	@echo
	@echo "LATEST:"
	poetry show --latest

lint: ## Runs bandit and black in check mode
	poetry run flake8 .
	@echo '-------------------------------'
	poetry run bandit -r python_codeartifact_demo

test: hidden ## run pytest with coverage
	poetry run pytest -v --cov python_codeartifact_demo

build: install lint test ## run `poetry build` to build source distribution and wheel
	poetry build
run: ## run `poetry run python-codeartifact-demo`
	poetry run python-codeartifact-demo
