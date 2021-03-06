#!/bin/bash
# setting up new django app (things that are left from django-admin)

if [ "$#" -ne 1 ]; then
    echo "Please specify new app name !"
    echo "setup_app.sh [my_app_name]"
    exit
fi

app_name=$1

# renaming subdirectories and the app directories
mv template_app/templates/template_app template_app/templates/$app_name
mv template_app/static/template_app template_app/static/$app_name

mv template_app $app_name
mv template_app_demo $app_name'_demo'

# removing stuff from the template
rm README.rst
rm TODO.rst
rm CHANGELOG

# renaming the templates to real files
mv docs/index.rst-tpl docs/index.rst
mv CHANGELOG.rst-tpl CHANGELOG
mv VERSION.rst-tpl VERSION
mv README.rst-tpl README.rst
mv TODO.rst-tpl TODO.rst

# futher instructions in case of using a cloned repo
echo In case you already have a repository where you generated the app in, one needs to move everything one dir level up:
echo mv ../$app_name ../$app_name'_old'
echo 'mv {.,}* ..'
echo cd ..
echo rmdir $app_name'_old'
