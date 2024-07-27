
# My Neovim Config

<pre align="center">
      ,l;             c,      
   .:ooool'           loo:.   
 .,oooooooo:.         looooc, 
ll:,loooooool,        looooool
llll,;ooooooooc.      looooooo
lllllc,coooooooo;     looooooo
lllllll;,loooooool'   looooooo
lllllllc .:oooooooo:. looooooo
lllllllc   'loooooool,:ooooooo
lllllllc     ;ooooooooc,cooooo
lllllllc      .coooooooo;;looo
lllllllc        ,loooooool,:ol
 'cllllc         .:oooooooo;. 
   .;llc           .loooo:.   
      ,;             ;l;      
</pre>


I use `Packer` for plugin management.

- Plugin specific configs can be found in `lua/primebrook/<plugin_name>.lua`.
- Key Remaps can be found in `lua/primebrook/remap.lua`.
- Filetype specific configs can be found in `lua/primebrook/ftplugin/<filetype>.lua`.




## Dependencies

1. NeoVim (`brew install neovim`)
2. Ripgrep (`brew install ripgrep`)
3. File Formatters:
    - jq (JSON formatter) (`brew install jq`)
    - shfmt (shell file formatter) (`brew install shfmt`)
    - stylua (lua file formatter) (`brew install stylua`)
    - yamlfmt (yaml file formatter) (`brew install yamlfmt`).
4. gh (GitHub CLI) (`brew install gh`)
5. Language Servers (`elixirls`, `pyright`, `clangd`, `tsserver`)


## Language Servers Setup:

e.g. elixir:

1. Download latest ElixirLS from [here](https://github.com/elixir-lsp/elixir-ls/releases).
    1. Unzip in a suitable location:
    ```
    unzip /Users/brook/Downloads/elixir-ls-v0.19.0.zip -d ~/.elixir-ls
    ```
    2. Make the language_server scrip executable:
    ```
    chmod +x ~/.elixir-ls/language_server.sh
    ```
2. Link the language server start script location in lsp.lua config.


Language Servers:

- `elixirls` (Elixir)
- `pyright` (Python)
- `clangd` (C/C++)
- `tsserver` (TypeScript)
- `marksman` (Markdown)
