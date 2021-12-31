# Vim Configuration
![Vim](3467fe8.png)

- Vim distribution : [NeoVim](https://neovim.io)

Vim configuration is done using Lua. Refer to `init.lua`.
A list of plugins I use can be found in the `lua/plugins.lua` file.
I use Neovim's native LSP. I used CoC before, and the native LSP seems to offer a better performance. The configuration for the LSP can be found in `lua/lspconf.lua`. It also contains the Treesitter config.
I use Telescope for searching for all lists, like files, buffers, diagnostics, etc. The config is in `lua/telescopeconf.lua`.

I also have a minimal Vim config in `minimal.vim` that I use for quick edits (without loading all plugins and LSP, etc). It was created because earlier my Vimscript-based setup was slow to load. After I migrated the Vim config to Lua, the minimal dotfile is not really necessary.

