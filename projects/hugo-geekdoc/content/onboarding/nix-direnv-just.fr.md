---
title: Nix, Direnv, Just, le trio qui simplifie la vie
resources:
  - name: demo-jsl-devops
    src: demo-jsl-devops.gif
    title: "JSL Devops demo"
    params:
      credits: "Onboarding pour le projet devops.jesuislibre.org"
---

{{< hint type="note" title="Introduction" >}}

Rien n'est plus frustrant lorsqu'on travaille sur un projet que de devoir :

- Chercher les outils nécessaires pour travailler sur ce projet (compilation,
  développement, etc.).
- Gérer les versions des paquets installés en fonction de leur date
  d'installation.
- Gérer les distributions sur lesquelles ces paquets sont installés
  (gestionnaire de paquets utilisé).

{{< /hint >}}

Pendant la phase de développement d'un projet, maintenir un environnement de
développement cohérent qui évolue au fil du temps est assez difficile, en raison
notamment des éléments suivants :

- Certains paquets ne sont pas disponibles sur toutes les distributions Windows,
  MacOS, Linux (Ubuntu, Archlinux, Fedora, Suse, etc.).
- Des versions de paquets peuvent devenir indisponibles suite à l'évolution
  d'une distribution.

Certains langages de programmation modernes l'ont bien compris, ils disposent de
systèmes de gestion de dépendances dotés de fonctionnalités de verrouillage pour
assurer la reproductibilité des environnements de développement, notamment :

- Go
- Python
- Ruby
- Rust
- etc ...

Ces systèmes permettent de maintenir les mêmes dépendances tout au long de la
durée de vie du projet, mais cela ne s'applique qu'aux bibliothèques utilisées
et non à tous les outils tiers.

C'est pour cette raison que j'utilise le trio :

- **Nix:** Permet d'obtenir un système reproductible.
- **Direnv:** Permet d'exécuter une commande lors de l'entrée dans un
  répertoire.
- **Just:** Fournit un gestionnaire de commandes ainsi que l'affichage de
  l'aide.

## Installation

### Direnv

Installer le paquet direnv

```shell
# install direnv
curl -sfL https://direnv.net/install.sh | bash
```

Configurer le shell pour la prise en compte de `direnv` lors d'un nouveau shell.

{{< tabs "shell-config" >}}

{{< tab "Bash" >}}

Ajouter la ligne suivante à la fin du fichier `~/.bashrc` :

```shell
eval "$(direnv hook bash)"
```

Ajouter la ligne suivante à la fin du fichier `~/.zshrc` :

{{< /tab >}}

{{< tab "ZSH" >}}

```shell
eval "$(direnv hook zsh)"
```

{{< /tab >}}

{{< tab "FISH" >}}

Ajouter la ligne suivante à la fin du fichier `~/.config/fish/config.fish` :

```shell
direnv hook fish | source
```

Fish supporte 3 modes que vous pouvez définir avec la variable d'environnement
globale `direnv_fish_mode` :

```text
set -g direnv_fish_mode eval_on_arrow    # Déclenche direnv à l'invite, et à chaque changement de répertoire par flèche (par défaut)
set -g direnv_fish_mode eval_after_arrow # Déclenche direnv à l'invite, et seulement après les changements de répertoire par flèche avant d'exécuter la commande 
set -g direnv_fish_mode disable_arrow    # Déclenche direnv à l'invite uniquement, il s'agit d'une fonctionnalité similaire au comportement original
```

{{< /tab >}}

{{< /tabs >}}

### Nix

{{< tabs "os-installation" >}}

{{< tab "Linux" >}}

```shell
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf)
```

{{< /tab >}}

{{< tab "Windows" >}}

```shell
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf)
```

{{< /tab >}}

{{< tab "MacOS" >}}

```shell
sh <(curl -L https://nixos.org/nix/install)
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf)
```

{{< /tab >}}

{{< /tabs >}}

{{< hint type=note title="A noter" >}}

Une fois **nix** et **direnv** installés, lors de votre premier accès au
répertoire d'un projet, vous devrez autoriser l'exécution automatique de
**direnv** avec la commande suivante : `direnv allow`

{{< /hint >}}

{{< hint type=tip title=Conseil >}}

Vous pouvez égallement lancer le onboarding avec la commande suivante
`nix develop`

{{< /hint >}}

### just

L'outil `just` sera installé automatiquement avec `nix` et `flake`, voir la
section suivante.

## Configuration du Onboarding projet

Pour activer l'onboarding du projet, il suffit de copier les 3 fichiers
ci-dessous dans le repertoire racine de votre projet.

```text
projet
├─ .envrc
├─ flake.nix
└─ justfile
```

Configuration du fichier **.envrc**

```shell
use flake
```

Configuration du fichier **flake.nix**

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = with pkgs;
          mkShell {
            name = "Default developpement shell";
            packages = [
              cocogitto
              nixpkgs-fmt
              nodePackages.markdownlint-cli
              pre-commit

              deno
              gum
              just
            ];
            shellHook = ''
              export PROJ="devops.jesuislibre.org"

              echo ""
              echo "⭐ Welcome to the $PROJ project ⭐"
              echo ""
            '';
          };
      });
}
```

Configuration du fichier **justfile**

```text
#!/usr/bin/env just -f

# This help
# Help it showed if just is called without arguments
@help:
    just -lu | column -s '#' -t | sed 's/[ \t]*$//'

###############################################################################
# pre-commit
###############################################################################

# Setup pre-commit
precommit-install:
    #!/usr/bin/env bash
    test ! -f .git/hooks/pre-commit && pre-commit install || true

# Update pre-commit
@precommit-update:
    pre-commit autoupdate

# precommit check
@precommit-check:
    pre-commit run --all-files

###############################################################################
# Tools
###############################################################################

# Update documentation
@doc-update FAKEFILENAME:
    ./updatedoc.ts

# Lint the project
@lint:
    pre-commit run --all-files

# Repl the project
@repl:
    nix repl --extra-experimental-features repl-flake .#

# Show installed packages
@packages:
    echo $PATH | tr ":" "\n" | grep -E "/nix/store" | sed -e "s/\/nix\/store\/[a-z0-9]\+\-//g" | sed -e "s/\/.*//g"
```

## Exemple d'utilisation

Voici un exemple d'utilisation pour le projet de documentation de
[JSL Devops](https://devops.jesuislibre.org)

Dans un premier temps, vous remarquerez que les outils just et hugo ne sont pas
disponibles dans la distribution de l'utilisateur. Cependant, sans intervention
de sa part, vous constaterez qu'ils deviennent disponibles grâce à `Nix` et au
fichier `flake.nix`.

{{< img name="demo-jsl-devops" size=origin lazy=false >}}
