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

Plugin specific configs can be found in `lua/primebrook/<plugin_name>.lua`.

Key remaps can be found in `lua/primebrook/remap.lua`

I use `Packer` for plugin management.

I use `stylua` for formatting of lua files.

## Dependencies

1. NeoVim (`brew install neovim`)
2. Ripgrep (`brew install ripgrep`)
3. jq (JSON formatter) (`brew install jq`)
4. shfmt (shell file formatter) (`brew install shfmt`)
5. Language Servers (`elixirls`, `pyright`, `clangd`)


## Language Servers Setup:

e.g. elixir:

1. Download latest ElixirLS from [here](https://github.com/elixir-lsp/elixir-ls/releases).
    1. Unzip in a suitable location:
    ```
    unzip /Users/brook/Downloads/elixir-ls-v0.19.0.zip -d ~/.bin/elixir-ls-v0.19.0
    ```
    2. Make the language_server scrip executable:
    ```
    chmod +x ~/.bin/elixir-ls-v0.19.0/language_server.sh
    ```
2. Link the language server start script location in lsp.lua config.

# To Do

- [ ] Have telescope's find_files include dotfiles
