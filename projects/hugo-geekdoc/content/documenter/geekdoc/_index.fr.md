---
title: Geekdoc
resources:
  - name: demo-geekdoc
    src: demo-geekdoc.gif
    title: "geekdoc demo"
    params:
      credits: "devops.jesuislibre.org documentation website installation demo"
---

{{< hint type=note title=Intro >}} [Hugo](https://gohugo.io/) est un générateur
de site statique rapide et flexible, tandis que [Geekdoc](https://geekdocs.de/)
est un thème spécialement conçu pour la documentation technique. Ensemble, ils
offrent de nombreux avantages pour la création de sites de documentation.

{{< /hint >}}

## Pourquoi geekdoc ?

D'une part, `Geekdoc` offre une structure de navigation claire et organisée, ce
qui permet aux utilisateurs de trouver rapidement les informations dont ils ont
besoin, mais égallement `Geekdoc` s'appuie sur [Hugo](https://gohugo.io/), ce
qui lui permet hériter des features suivantes :

- Support du multi-langes
- customisation de fonction grace au shortcodes d'hugo.
- Generation des pages ultra rapide

Mais surtout grace à hugo, il est possible d'avoir un site de documentation
statisque (pas besoin de serveur `PHP` ou `Node.js`)

## Installation

L'installation de `Geekdoc` utilisera le trio
[nix, direnv, just](/onboarding/nix-direnv-just). Ce trio permet d'installer
automatiquement un environement de developpement ainsi qu'il facilite la
contribution à un projet sans devoir installer les outils nécéssaire pour y
contribuer.

Donc pour installer et configurer `Geekdoc`, commencer par
[installer le trio nix, direnv, just](/onboarding/nix-direnv-just).

Ensuite récupérer et configurer le template `hugo-geekdoc` avec les commandes
suivantes

```shell
nix flake new -t "github:badele/nix-projects#hugo-geekdoc" geekdoc
cd geekdoc
nix develop
sh init_project
```

## Exemple d'utilisation

Voici un exemple d'utilisation de ce template pour le site
[JSL Devops documentation](https://devops.jesuislibre.org)

{{< img name="demo-geekdoc" size=origin lazy=false >}}
