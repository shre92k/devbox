# devbox

## Install devbox.
### Linux
```
curl -fsSL https://get.jetify.com/devbox | bash
```

### MacOS
```
curl -fsSL https://get.jetify.com/devbox | bash
```

Now Clone the repo and cd into it

## Run Devbox shell script
For completely isolated shell ( you can skip the --pure flag if you want to inherit base parent variables)
```
devbox shell --pure
```
Exit this shell just for the first time
```
exit
```

## Install zsh plugins
Enter the shell once again
```
devbox shell --pure
```
Once inside the shell
```
export ZSH_CUSTOM
sh install_zsh_plugins.sh
source .zshrc
```
You self contained shell is ready.
Exit to exit the shell

```
exit
```


