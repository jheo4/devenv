# Save:
dconf dump /org/gnome/terminal/ > ~/gterminal.preferences

#Install:
cat gterminal.profiles | dconf load /org/gnome/terminal/legacy/profiles:/

