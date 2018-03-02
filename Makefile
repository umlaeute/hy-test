#!/usr/bin/env make -f

VIRTUALENV=_hytest
PYIFLAGS += --additional-hooks-dir .

.PHONY: hy py exe hcl clean setup

hy: $(VIRTUALENV)/bin/hy hello.hy
	$^
py: wrapper.py $(VIRTUALENV)/bin/hy hello.hy
	$(VIRTUALENV)/bin/python $<

exe: dist/wrapper/wrapper
	$^

hcl:
	$(VIRTUALENV)/bin/python -c "import hy.core.language"

clean:
	rm -rf build dist

dist/wrapper/wrapper: clean
	$(VIRTUALENV)/bin/pyinstaller $(PYIFLAGS) wrapper.spec

wrapper.spec: $(VIRTUALENV)/bin/pyinstaller
	$(VIRTUALENV)/bin/pyi-makespec wrapper.py
$(VIRTUALENV)/bin/python:
	virtualenv -p python3 $(VIRTUALENV)
$(VIRTUALENV)/bin/pyinstaller: $(VIRTUALENV)/bin/python
	$(VIRTUALENV)/bin/pip install https://github.com/pyinstaller/pyinstaller/archive/develop.zip
$(VIRTUALENV)/bin/hy: $(VIRTUALENV)/bin/python
	$(VIRTUALENV)/bin/pip install hy

setup: $(VIRTUALENV)/bin/hy $(VIRTUALENV)/bin/pyinstaller
