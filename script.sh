#!/bin/bash
git config --global user.name ${GIT_USER_NAME}
git config --global user.email ${GIT_USER_EMAIL}
sed -i'' "s~git@github.com:anbuchelva/blog.git~https://${GH_TOKEN}:x-oauth-basic@github.com/anbuchelva/blog.git~"_config.yml
git submodule init
git submodule update
cd themes/tranquilpeak
NODE_ENV=development npm install
npm install grunt-cli -g
npm install bower -g
bower install
grunt buildProd
cd ..
hexo clean
hexo algolia
