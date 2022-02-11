.PHONY: gitconfig-include-local
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --no-builtin-variables
SHELL := /bin/bash
DIR := ${CURDIR}

gitconfig-include-local:
	git config --local include.path "$$(git rev-parse --show-toplevel)/.gitconfig"
	
submodule-update:
	git su

install-vscode-php-debug:
	$(DIR)/bin/vscode-php-debug install 1.23.0

start: gitconfig-include-local submodule-update install-vscode-php-debug

check-requirements:
	$(DIR)/.config/bin/check-requirements
