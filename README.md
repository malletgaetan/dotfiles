# minimal config

## non-default dependencies

| name | install |
| ---- | ------- |
| ripgrep | sudo apt install ripgrep |
| fg | sudo apt install fd-find |
| monaspace Krypton | https://github.com/githubnext/monaspace |
| kitty | https://sw.kovidgoyal.net/kitty/binary/ |
| nvim | https://github.com/neovim/neovim/releases |
| packer | https://github.com/wbthomason/packer.nvim |

## nvim cheat sheet

| keys | action |
| ----- | ------- |
| j | go left |
| ; | go right |
| l | go up |
| k | go down |
| w | go to start of next word |
| b | go to start of previous word |
| e | go to end of current word |
| gg | go first line of file |
| G | go last line of file |
| v | enter visual mode |
| V | enter visual + select whole line |
| yy | yank line |
| y | yank selected |
| dd | cut line |
| d | cut selected |
| p | paste from volatile register after cursor |
| P | paste from volatile register before cursor |
| $ | go last char of line |
| _ | go first non empty character of line |
| "0p | paste from non volatile yank register |
| fa | go to next 'a' character on line |
| di( | delete inside '(' ')' |
| da( | delete around '(' ')' |
| :%s/a/b/g | regex like, replace all occurences of 'a' to 'b' |

## gnome settings

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-applications "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
```
