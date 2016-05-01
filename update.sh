#!/usr/bin/env zsh

autoload -U zmv

# Images
cp -r AdminLTE/dist/img/* vendor/assets/images

# css
cp -r AdminLTE/dist/css/skins vendor/assets/stylesheets/adminlte
cp AdminLTE/dist/css/AdminLTE.css vendor/assets/stylesheets/adminlte/adminlte.css
cp AdminLTE/dist/css/AdminLTE.min.css vendor/assets/stylesheets/adminlte/adminlte.min.css
zmv -fC 'AdminLTE/plugins/(*)/(*).css' 'vendor/assets/stylesheets/adminlte/plugins/$1/$2.css'

# js
cp AdminLTE/dist/js/app.js vendor/assets/javascripts/adminlte/adminlte.js
cp AdminLTE/dist/js/app.min.js vendor/assets/javascripts/adminlte/adminlte.min.js
zmv -fC 'AdminLTE/plugins/(*)/(*).js' 'vendor/assets/javascripts/adminlte/plugins/$1/$2.js'

# bootstrap
vared -p 'Which version of bootstrap do you want?: ' -c bs_version

if [ ! -z "$bc_version"]; then
  curl "https://maxcdn.bootstrapcdn.com/bootstrap/$bs_version/css/bootstrap.min.css" > vendor/assets/stylesheets/bootstrap.min.css
  curl "https://maxcdn.bootstrapcdn.com/bootstrap/$bs_version/css/bootstrap.css" > vendor/assets/stylesheets/bootstrap.css
  curl "https://maxcdn.bootstrapcdn.com/bootstrap/$bs_version/css/bootstrap.map" > vendor/assets/stylesheets/bootstrap.map
  
  curl "https://maxcdn.bootstrapcdn.com/bootstrap/$bs_version/js/bootstrap.min.js" > vendor/assets/javascripts/bootstrap.min.js
  curl "https://maxcdn.bootstrapcdn.com/bootstrap/$bs_version/js/bootstrap.js" > vendor/assets/javascripts/bootstrap.js
fi