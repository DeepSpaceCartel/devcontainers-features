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

### `pip`

Install `pre-commit` via PIP Installs Packages:

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "remoteEnv": {
        "PATH": "${containerEnv:PATH}:/opt/pip/bin"
    },
    "features": {
        "ghcr.io/deep-space-cartel/devcontainers-features/pip:1": {
            "packages": "pre-commit",
            "location": "/opt/pip/bin",
        }
    }
}
```

Configure `pre-commit`:

```bash
pre-commit sample-config > .pre-commit-config.yaml
pre-commit install
pre-commit run --all-files
```

### `starship`

The minimal, blazing-fast, and infinitely customizable prompt for any shell!

* <https://starship.rs/>

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/deep-space-cartel/devcontainers-features/starship:latest": {
            "version": "latest"
        }
    }
}
```

Since `starship` is managed by configuration files in `$HOME` consider using the following repo to automate the process or fork it and adjust to your liking.

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

If you are using `devcontainers-features/apt` as well then you might have to add `bash-completion` to list of the packages.

```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/deep-space-cartel/devcontainers-features/starship:latest": {
            "version": "latest"
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
```

Generate docs:

```bash
devcontainer features generate-docs --namespace deep-space-cartel/devcontainers-features --project-folder src/
```

## TODO

* [ ] [Update collection-index.yml #453](https://github.com/devcontainers/devcontainers.github.io/pull/453).
* [ ] Integrate `starship completions $(basename $SHELL)`.
* [ ] Extract `bash-completion` installation into `utils` package.
