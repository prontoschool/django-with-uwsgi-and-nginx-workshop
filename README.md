Setting up Django with uWSGI and Nginx
======================================

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

***Current Stack of Components:*** Web Client <-> uWSGI <-> Python

Then

Change `wsgi.py` to use the local settings before run the command below.
```uwsgi --http :8000 --module uwsgi_tutorial.wsgi```

***Current Stack of Components:*** Web Client <-> uWSGI <-> Django

Install Nginx using

```
sudo apt-get install nginx
```

***Current Stack of Components:*** Web Client <-> Web Server

Make a symbolic link from `/etc/nginx/site-enabled/` to our Nginx configuration file:

```
sudo ln -s /vagrant/uwsgi_tutorial_nginx.conf /etc/nginx/sites-enabled/
```

Make a new folder called `/media/` to serve static files like pictures.

Deploy static files, run `python manage.py collectstatic`.

Restart Nginx, run `sudo service nginx restart`.

Put `high-five-bear.jpg` in `/media/`.

Try to access the file from the browser.

Run our Django app with uWSGI and Nginx.

We will configure uWSGI to run with a `.ini` file.

Use `uwsgi_tutorial_uwsgi.ini`.

Run `uwsgi --ini /vagrant/uwsgi_tutorial_uwsgi.ini`.
