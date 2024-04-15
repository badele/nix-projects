# Output format
Output demo-geekdoc.gif

Require nix

Set Shell "bash"
Set FontSize 18
Set Width 800
Set Height 680

###############################################################################
# Init project
###############################################################################

Type "cd /tmp ; nix flake new -t 'github:badele/nix-projects#hugo-geekdoc' devops.jesuislibre.org" Sleep 500ms  Enter

Type "cd /tmp/devops.jesuislibre.org" Sleep 500ms  Enter

Type "nix develop" Sleep 500ms  Enter  Sleep 4s 

Type "sh init_project" Sleep 500ms  Enter Sleep  1s

Type "github.com" Sleep 500ms  Enter Sleep 1s

Type "badele" Sleep 500ms  Enter Sleep 1s

Type "devops.jesuislibre.org" Sleep 500ms  Enter Sleep 1s

Type "https://devops.jesuislibre.org" Sleep 500ms  Enter Sleep 1s

Type "JSL Devops" Sleep 500ms  Enter Sleep 1s

###############################################################################
# Push project
###############################################################################

Type "git remote add origin git@github.com:badele/devops.jesuislibre.org.git" Sleep 500ms  Enter Sleep 1s
Type "git commit -m 'feat: init project'" Sleep 500ms  Enter Sleep 3s
Type "git push -u origin main" Sleep 500ms  Enter Sleep 3s

Sleep 5s
