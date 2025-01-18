# astronvim-user-config


## Migration to AstroNvim v4

Clone this repo into `~/.config/nvim/lua/user`

To load the config, add the following line to `~/.config/nvim/lua/lazy_setup.lua`:


```lua
  { import = "user/plugins" },
  { import = "user" },
```

After 

```lua
  { import = "community" },
  { import = "plugins" },
```

## Neovide settings

Update the config file: https://neovide.dev/config-file.html

```bash
nvim /mnt/c/Users/{USER}/AppData/Roaming/neovide/config.toml
```

config.toml

```toml
wsl = true
neovim-bin = "/home/{USER}/.local/share/mise/shims/nvim"
```