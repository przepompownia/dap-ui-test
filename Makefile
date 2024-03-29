.PHONY: gitconfig-include-local submodule-update install-vscode-php-debug start cursor-position-outside-buffer
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
SHELL := /bin/bash
DIR := ${CURDIR}
nvim := nvim-from-src
vscodePhpDebugVersion := '1.30.0'

gitconfig-include-local:
	git config --local include.path "$$(git rev-parse --show-toplevel)/.gitconfig"
	
submodule-update:
	git su

install-vscode-php-debug:
	$(DIR)/bin/vscode-php-debug install $(vscodePhpDebugVersion)
	$(DIR)/bin/vscode-php-debug setAsCurrent $(vscodePhpDebugVersion)

start: gitconfig-include-local submodule-update install-vscode-php-debug

test-visual-evaluation:
	$(DIR)/bin/$(nvim) -S ./test/01-float-hover-clean/run.vim test/fixture/foo.php

test-close-hover-window:
	$(DIR)/bin/$(nvim) -S ./test/02-float-hover-clean/run.vim test/fixture/foo.php

cursor-position-outside-buffer:
	$(DIR)/bin/$(nvim) -S ./test/03-cursor-position-outside-buffer/run.vim

large-hover-content:
	$(DIR)/bin/$(nvim) -S ./test/04-large-hover-content/run.vim

anonymous-class:
	$(MAKE) install-vscode-php-debug vscodePhpDebugVersion='1.24.0'
	$(DIR)/bin/$(nvim) -S ./test/06-anonymous-class/run.vim

anonymous-class-1.24.1:
	$(MAKE) install-vscode-php-debug vscodePhpDebugVersion='1.24.1'
	$(DIR)/bin/$(nvim) -S ./test/07-anonymous-class-w-adapter-1.24/run.vim

anonymous-class-1.24.2:
	$(MAKE) install-vscode-php-debug vscodePhpDebugVersion='1.24.2'
	$(DIR)/bin/$(nvim) -S ./test/07-anonymous-class-w-adapter-1.24/run.vim

long-line-hover:
	$(MAKE) install-vscode-php-debug vscodePhpDebugVersion='1.26.1'
	$(DIR)/bin/$(nvim) -S ./test/08-long-line-hover/run.vim

line-hover-extmarks-after-tabclose:
	$(MAKE) install-vscode-php-debug vscodePhpDebugVersion='1.26.1'
	$(DIR)/bin/$(nvim) -S ./test/09-extmarks/run.vim

virtual-text-callback:
	$(MAKE) install-vscode-php-debug vscodePhpDebugVersion='1.30.0'
	$(DIR)/bin/$(nvim) -S ./test/10-virtual-text-display-callback/run.vim

check-requirements:
	$(DIR)/.config/bin/check-requirements
