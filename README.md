# nix-projects

## Nix installation

Before using this project and if you not have the Nix/NixOS, your must install it

Below command install `nix` and `flake` tool

```shell
# linux/windows
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)

# macos 
sh <(curl -L https://nixos.org/nix/install)
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)
```
## Project initialisation

### Github

- From github website, create repository (without enabled
"Initialize this repository with")
- Enable **Read and write permissions** on the [Workflow permission section](
<https://github.com/badele/test/settings/actions>)

```shell
nix flake new -t "github:badele/nix-projects#minimal" your-project-name
cd your-project-name
sh init_project
nix develop
```

### Project

| Project                              | Description              |
| -                                    | -                        |
| [deno](projects/deno)                | deno project + CI        |
| [deno-module](/projects/deno-module) | deno module project + CI |
| [**minimal**](projects/minimal)      | **minimal project + CI** |
| [scala](projects/scala)              | scala project + CI       |
