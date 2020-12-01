spicetify
spicetify backup apply enable-devtool
cd $home\Downloads
git clone https://github.com/khanhas/spicetify-cli.git
cd $home\Downloads\spicetify-cli
Copy-Item -Path "$home\Downloads\spicetify-cli\Themes" -Destination "$home\.spicetify\" -Recurse
Copy-Item -Path "$home\Downloads\spicetify-cli\Extensions" -Destination "$home\.spicetify\" -Recurse
Copy-Item -Path "$home\Downloads\spicetify-cli\CustomApps" -Destination "$home\.spicetify\" -Recurse
cd $home\.spicetify\Themes
git init
git remote add origin https://github.com/morpheusthewhite/spicetify-themes.git
git pull origin master
cd "$(spicetify -c | Split-Path)\CustomApps"
git clone https://github.com/khanhas/genius-spicetify genius
spicetify config custom_apps genius
cd "$(spicetify -c | Split-Path)\Themes"
git clone https://github.com/khanhas/google-spicetify
spicetify config extensions bookmark.js
spicetify config extensions fullAppDisplay.js
spicetify config extensions keyboardShortcut.js
spicetify config extensions newRelease.js
spicetify config extensions queueAll.js
spicetify config extensions shuffle+.js
spicetify config extensions trashbin.js
spicetify config extensions webnowplaying.js
spicetify config custom_apps reddit
spicetify config current_theme google-spicetify
spicetify config color_scheme Dark
spicetify apply