# Dev Container Features

## Features

### `apt`

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/deep-space-cartel/devcontainers-features/apt:latest": {
            "packages": "shellcheck shfmt"
        }
    }
}
```

### `starship`

The minimal, blazing-fast, and infinitely customizable prompt for any shell!

* <https://starship.rs/>

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/deep-space-cartel/devcontainers-features/starship:latest": {
            "version": "latest"
        }
    }
}
```

```json
{
    "customizations": {
        "vscode": {
            "settings": {
                "dotfiles.repository": "deep-space-cartel/dotfiles"
            }
        }
    }
}
```

In order to configure fonts install them in your OS:

* <https://www.nerdfonts.com/font-downloads>

Then configure `starship`:

* <https://starship.rs/presets/nerd-font>

After that configure VS Code:

* <https://code.visualstudio.com/docs/terminal/appearance>

```json
{
    "customizations": {
        "vscode": {
            "settings": {
                "editor.fontFamily": "'Hack Nerd Font Mono'",
                "terminal.integrated.fontFamily": "'Hack Nerd Font Mono'"
            }
        }
    }
}
```

Example prompt with git details:

```bash
devcontainers-features on  main +2/-1 [📝✓]
⬢ [Docker] ❯ starship --version
starship 1.20.1
branch:master
commit_hash:f505324
build_time:2024-07-27 09:09:51 +00:00
build_env:rustc 1.80.0 (051478957 2024-07-21),
```

Example of when you have to force push:

```bash
devcontainers-features on  main +/- [++(2)✓]
⬢ [Docker] ❯ git commit --amend
...
devcontainers-features on  main +/- [😵] took 10s
⬢ [Docker] ❯ git status
On branch main
Your branch and 'origin/main' have diverged,
and have 1 and 1 different commits each, respectively.
  (use "git pull" if you want to integrate the remote branch with yours)

nothing to commit, working tree clean

devcontainers-features on  main +/- [😵]
```

Consider using along with:

* <https://github.com/deep-space-cartel/dotfiles>

## Development

Run local checks:

```bash
pre-commit run --hook-stage manual
```

Upload packages

```bash
devcontainer features publish --namespace deep-space-cartel/devcontainers-features src/
``

Generate docs:

```bash
devcontainer features generate-docs --namespace deep-space-cartel/devcontainers-features --project-folder src/
```

## TODO

* Go to [github.com/devcontainers/devcontainers.github.io](https://github.com/devcontainers/devcontainers.github.io)
  * This is the GitHub repo backing the [containers.dev](https://containers.dev/) spec site
* Open a PR to modify the [collection-index.yml](https://github.com/devcontainers/devcontainers.github.io/blob/gh-pages/_data/collection-index.yml) file
* Integrate `starship completions $(basename $SHELL)`
