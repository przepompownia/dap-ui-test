# Portable vim environment

## Goals
- test dap-ui

## Install and configure extensions
- Run `make check-requirements` to check requirements that may be needed to use extensions used there
- Run `make start` to configure local git aliases, then fetch, install and prepare extensions

## Running
```sh
./bin/nvim-from-system
```

You can append `"</path/to/this/project>/bin"` to `"$PATH"` in your shell environment if you want to use some copy of this project as a regular vim environment. Then check if the above executables replace the previously used `vim` and `neovim` (`command -V nvim` for example). It also simplifies using this executables by GUI (`nvim-qt`).

Note that some extensions are not loaded by `packadd!` from `init.vim`.
