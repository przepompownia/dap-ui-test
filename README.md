## Goal
- test dap-ui

## Install and configure extensions
- Use nightly/master version of neovim
- Run `make check-requirements` to check requirements that may be needed to use extensions used there
- Check if you have XDebug extension for PHP
- Run `make start` to configure local git aliases, then fetch, install and prepare extensions

## Run test
- Run `make test-visual-evaluation`
- Run `make test-close-hover-window`
- Run `make cursor-position-outside-buffer`
- Run `make large-hover-content`
- Run `make anonymous-class`
- see plugin/dap*.lua for mappings
- eval visual selection content using `,de` (dap-ui) and `,dh` (dap)
- observe `/tmp/xdebug.log` and dap.log (see `:help dap.set_log_level()`)
