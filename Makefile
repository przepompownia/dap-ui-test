.PHONY: gitconfig-include-local
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
SHELL := /bin/bash
DIR := ${CURDIR}
nvim := nvim-from-system

gitconfig-include-local:
	git config --local include.path "$$(git rev-parse --show-toplevel)/.gitconfig"
	
submodule-update:
	git su

install-vscode-php-debug:
	$(DIR)/bin/vscode-php-debug install 1.23.0
	$(DIR)/bin/vscode-php-debug setAsCurrent 1.23.0

start: gitconfig-include-local submodule-update install-vscode-php-debug

test-visual-evaluation:
	$(DIR)/bin/$(nvim) -S ./test/01-float-hover-clean/run.vim test/fixture/foo.php

test-close-hover-window:
	$(DIR)/bin/$(nvim) -S ./test/02-float-hover-clean/run.vim test/fixture/foo.php

cursor-position-outside-buffer:
	$(DIR)/bin/$(nvim) -S ./test/03-cursor-position-outside-buffer/run.vim

check-requirements:
	$(DIR)/.config/bin/check-requirements
