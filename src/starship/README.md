# Starship

The minimal, blazing-fast, and infinitely customizable prompt for any shell!

* <https://starship.rs/>

## Example Usage

```json
"features": {
    "ghcr.io/deep-space-cartel/devcontainer-features/starship:1": {
        "version": "latest"
    },
}
```

## Options

| Options Id | Description                                                                   | Type   | Default Value                 |
| ---------- | ----------------------------------------------------------------------------- | ------ | ----------------------------- |
| platform   | One of `win` (Git Bash), `darwin`, `linux`, `linux_musl` (Alpine), `freebsd`, | string | *identified by the installer* |
| bin-dir    | The directory to install the binary to                                        | string | `/usr/local/bin`              |
| arch       | One of `x86_64`, `i386`, `arm`, `arm64`                                       | string | *identified by the installer* |
| base-url   | The base URL to download the binary from                                      | string | […/releases][1]             |
| version    | The version of the binary to install                                          | string | `latest`                      |

## Testing

```bash
devcontainer features test \
    --features starship   \
    --remote-user root \
    --skip-scenarios   \
    --base-image mcr.microsoft.com/devcontainers/javascript-node:1-20-bookworm \
    /workspaces/devcontainers-features
```

[1]: https://github.com/starship/starship/releases
