generic django-app-template
============================

An extended and functional application template for pyhton3-django (>v2.0)

1. Install lara-django (> ver2.0)
   
	pip3 install django


1. generate app

	django-admin startapp --template=https://github.com/markdoerr/django-app-template/archive/master.zip --extension=rst-tpl  my-django-app 
  
  # this is not working yet : --authors=ben --creation_date=$(date -I)
  
finally fix some things, django-admin has not done
  
	cd [your_new_app_dir]
	setup_app.sh [your_new_app_name]  # this will rename and delete some files and directories 
    
    
1. Add my-django-app to your INSTALLED_APPS setting like this::
    
    INSTALLED_APPS = [
        ...
        'my-django-app',
    ]

1. Include the lara-django-app URLconf in your project urls.py like this::

    path('app/', include('lara-django-app.urls')),

1. Run `python3 manage.py migrate` to create the lara-django-devices models.

1. In case you like to test the app, please load the demo data:

1. Start the development server and visit http://127.0.0.1:8000/admin/
   to create a device (you'll need the Admin app enabled).

Environment variables
----------------------

for development, please set
::
      export DJANGO_SETTINGS_MODULE=lara.settings.devel

for production, please set
::
       export DJANGO_SETTINGS_MODULE=lara.settings.production
    
if your media does not reside in the default media folder, please set environment variable to
::
        export DJANGO_MEDIA_PATH='path/to/my/media'

to use user defined fixtures, please set:
::
        export DJANGO_FIXTURE_PATH='path/to/user/fixtures'



Installation of required packages
---------------------------------
::
        pip3 install --user requirements/devel.py


Testing all applications
________________________

use this command to run all tests:

::
    python3 manage.py test
   
tox
   
testing the application
_________________________


from the directory where the main lara project is located, type

    ./manage.py test app

    

Generating documentation
________________________

To generate the documentation, please change directory to app and run:

    sphinx-apidoc -o docs .
    cd docs
    make html
    

Acknowledgements
________________

The LARA-django developers thank 

    * the python team
    * the whole django team (https://www.djangoproject.com/) for their great tool !
       
.. _Django: https://www.djangoproject.com/
.. _LARA: https://github.com/LARAsuite/
.. _pip: https://pypi.python.org/pypi/pip
