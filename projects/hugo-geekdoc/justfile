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
# Hugo
###############################################################################

[private]
hugo-download-theme:
    #!/usr/bin/env bash
    [ -e themes/hugo-geekdoc ] && rm -rf themes/hugo-geekdoc || true
    mkdir -p themes/hugo-geekdoc
    curl -L https://github.com/thegeeklab/hugo-geekdoc/releases/latest/download/hugo-geekdoc.tar.gz | tar -xz -C themes/hugo-geekdoc/ --strip-components=1

# Init hugo documentation site
@hugo-init: hugo-download-theme
    hugo new site . > /dev/null

@hugo-serve:
    hugo serve --debug --cleanDestinationDir -D

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
