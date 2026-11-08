# Devbox shell

A project-local Zsh environment with Oh My Zsh's `robbyrussell` theme,
Git aliases, live completion, autosuggestions, and syntax highlighting.

## Use

Install [Devbox](https://www.jetify.com/docs/devbox/installing_devbox/) and run:

```sh
devbox shell --pure
```

Run commands without opening an interactive shell:

```sh
devbox run -- git --version
devbox run check
```

`check` validates the Zsh configuration syntax. Use `exit` to leave the shell.
The init hook switches to the packaged Zsh only for interactive sessions, so
`devbox run` commands keep running normally.

## Configuration and state

- `devbox.json`: packages, project environment, and startup hook.
- `devbox.lock`: resolved package versions; include it in version control for reproducible installs. Use `devbox update` deliberately to refresh versions.
- `.zsh/.zshrc`: interactive shell configuration and plugin ordering.
- `.cache/`: disposable completion and Oh My Zsh caches.
- `.local/state/`: persistent shell history and autocomplete logs.
- `.local/share/`: autocomplete's recent directories.

`HOME` is set to `DEVBOX_PROJECT_ROOT` for both interactive shells and
`devbox run` commands. Tools use this project as their home directory.
`ZDOTDIR` selects this project's shell configuration. XDG cache, data,
and state directories also point into this project and are ignored by Git.
History is stored in `.local/state/zsh/history`; commands beginning with a
space are excluded. Existing `.zsh/.zsh_history` files are preserved but are
no longer used automatically. Copy any wanted history into the new file
while all Devbox shells are closed.

Autocomplete loads before Oh My Zsh to manage completion initialization;
syntax highlighting loads last. Oh My Zsh self-updates are disabled because
Nix manages its read-only installation. No extra plugin manager is needed.

The `locale` package is required for `/etc/zshrc` during pure-shell startup,
where macOS system utilities are absent from `PATH`.
Generated completion dumps previously stored under `.zsh/` can be deleted
and will be regenerated under `.cache/` when needed.
