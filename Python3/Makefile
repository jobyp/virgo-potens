.PHONY: all
all:
	@echo "make setup -- for setting up virtualenv"
	@echo "make clean"


.PHONY: setup
setup: py_pkgs activate
	rm -rf .venv
	python3 -m venv .venv
	source ./activate; \
	pip install --upgrade pip; \
	for p in $$(cat py_pkgs); do \
		pip install --upgrade $$p; \
	done

.PHONY: clean
clean:
	rm -vf *~
