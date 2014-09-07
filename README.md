django-with-uwsgi-and-nginx-workshop
====================================

Setting up Django with uWSGI and Nginx

Credit: http://uwsgi-docs.readthedocs.org/en/latest/tutorials/Django_and_nginx.html

***Goal:*** We are going to create a stack of components like this.

Web Client (Browser) <-> Web Server (Nginx) <-> uWSGI <-> Django

* Create a virtual environment.
* `pip install Django=1.6.2 South==0.8.4 django-debug-toolbar==0.11.0 uWSGI==1.9.20`
* Create a Django project using Django Two Scoops Template.
```
django-admin.py startproject --template=https://github.com/twoscoops/django-twoscoops-project/archive/1.5.zip --extension=py,rst,html uwsgi_tutorial
```
* Rename the project. `mv uwsgi_tutorial_project`

To test uWSGI: `uwsgi --http :8000 --wsgi-file uwsgi_test.py`


Change `wsgi.py` to use the local settings before run the command below.
```uwsgi --http :8000 --module uwsgi_tutorial.wsgi```

The current stack of components is like this.

Web Client <-> uWSGI <-> Django
