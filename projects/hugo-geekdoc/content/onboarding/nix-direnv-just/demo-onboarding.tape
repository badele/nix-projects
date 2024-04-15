# Output format
Output demo-onboarding.gif

Require nix

Set Shell "bash"
Set FontSize 18
Set Width 800
Set Height 680

###############################################################################
# No Nix onboaring Environment
###############################################################################

Type "# No nix onboarding environement available" Sleep 500ms  Enter Enter Sleep 1s

Type "cd /tmp" Sleep 500ms  Enter

Type "just" Sleep 500ms  Enter Sleep 2s

Type "hugo" Sleep 500ms  Enter Sleep 3s

Type "clear" Sleep 500ms  Enter
Type "# Now we will use the nix onboarding environement" Sleep 500ms  Enter Enter Sleep 2s

###############################################################################
# Nix onboarding Environment
###############################################################################


Type "cd ~/ghq/github.com/badele/devops.jesuislibre.org" Sleep 500ms  Enter

# Emulate direnv
Hide
Type "nix develop" Sleep 500ms  Enter Sleep 4s
Show

Type "just" Sleep 500ms  Enter Sleep 2s

Type "hugo version" Sleep 500ms  Enter Sleep 2s

Sleep 5s

