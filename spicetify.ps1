Set-ExecutionPolicy Unrestricted -scope CurrentUser
cd $home\Downloads
git clone https://github.com/khanhas/spicetify-cli.git
cd $home\Downloads\spicetify-cli
Copy-Item -Path "$home\Downloads\spicetify-cli\Themes" -Destination "$home\.spicetify\" -Recurse -Force
Copy-Item -Path "$home\Downloads\spicetify-cli\Extensions" -Destination "$home\.spicetify\" -Recurse -Force
Copy-Item -Path "$home\Downloads\spicetify-cli\CustomApps" -Destination "$home\.spicetify\" -Recurse -Force
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression
spicetify
spicetify backup apply enable-devtool
cd $home\.spicetify\Themes
git init
git remote add origin https://github.com/morpheusthewhite/spicetify-themes.git
git pull origin master
cd "$(spicetify -c | Split-Path)\CustomApps"
git clone https://github.com/khanhas/genius-spicetify genius
spicetify config custom_apps genius
cd "$(spicetify -c | Split-Path)\Themes"
git clone https://github.com/khanhas/google-spicetify
cd "$(spicetify -c | Split-Path)\Themes\DribbblishDynamic"
Copy-Item dribbblish-dynamic.js ..\..\Extensions
spicetify config extensions dribbblish-dynamic.js
spicetify config extensions bookmark.js
spicetify config extensions fullAppDisplay.js
spicetify config extensions keyboardShortcut.js
spicetify config extensions newRelease.js
spicetify config extensions queueAll.js
spicetify config extensions shuffle+.js
spicetify config extensions trashbin.js
spicetify config extensions webnowplaying.js
spicetify config current_theme DribbblishDynamic color_scheme dark
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify config custom_apps reddit
spicetify config current_theme google-spicetify
spicetify config color_scheme Dark
spicetify apply
