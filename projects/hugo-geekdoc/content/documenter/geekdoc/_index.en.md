---
title: Geekdoc
resources:
  - name: demo-geekdoc
    src: demo-geekdoc.gif
    title: "geekdoc demo"
    params:
      credits: "devops.jesuislibre.org documentation website installation demo"
---

{{< hint type=note title=Intro >}} [Hugo](https://gohugo.io/) is a generator
fast and flexible static site, while [Geekdoc](https://geekdocs.de/) is a theme
specially designed for technical documentation. Together they offer many
advantages for creating documentation sites.

{{< /hint >}}

## Why geekdoc?

On the one hand, `Geekdoc` offers a clear and organized navigation structure,
which which allows users to quickly find the information they need need, but
also `Geekdoc` relies on [Hugo](https://gohugo.io/), this which allows it to
inherit the following features:

- Multi-language support
- function customization thanks to Hugo's shortcodes.
- Ultra-fast page generation

But above all thanks to hugo, it is possible to have a documentation site
statistics (no need for `PHP` or `Node.js` server)

## Install

Installing `Geekdoc` will use the trio
[nix, direnv, just](/onboarding/nix-direnv-just). This trio allows you to
install automatically a development environment as well as it facilitates the
contribution to a project without having to install the necessary tools to do so
contribute.

So to install and configure `Geekdoc`, start with
[install the nix, direnv, just trio](/onboarding/nix-direnv-just).

Then retrieve and configure the `hugo-geekdoc` template with the commands
following

```shell
nix flake new -t "github:badele/nix-projects#hugo-geekdoc" geekdoc
cd geekdoc
nix develop
sh init_project
```

## Example of use

Here is an example of using this template for the site
[JSL Devops documentation](https://devops.jesuislibre.org)

{{< img name="demo-geekdoc" size=origin lazy=false >}}
