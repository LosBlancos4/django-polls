django-polls/README.rst¶
=====
Polls
=====

Polls is a Django app to conduct web-based polls. For each question,
visitors can choose between a fixed number of answers.

In addition, there is a possibility to give feedback to the admin 
as well as give donations for maintanance of the app

Detailed documentation is in the DOCS file.

Quick start
-----------

1. Add "polls" to your INSTALLED_APPS setting like this::

    INSTALLED_APPS = [
        ...
        'polls',
    ]

2. Include the following URLconfs in your project urls.py like this::

    path('login/', LoginView.as_view(template_name='polls/login.html')),
	path('logout/', LogoutView.as_view(next_page='/')),
    path('<int:question_id>/logout/', LogoutView.as_view(next_page='/')),
    path('<int:question_id>/vote/logout/', LogoutView.as_view(next_page='/')),
    path('', include('polls.urls'))

    Note! Add the following methods in the module:
        from django.urls import include, path
        from django.contrib.auth.views import LoginView, LogoutView

3. Add LOGIN_URLs parameters in the project settings::
        
    LOGIN_URL = '/login/'
    LOGIN_REDIRECT_URL = '/'

4. Run ``python manage.py migrate`` to create the polls models.

5. Create an sqlite database by running in django-polls directory
   python3 -m create_db.py

   Move db.sqlite3 file in main directory

5. Start the development server and visit http://127.0.0.1:8000/admin/
   to create a poll (you'll need the Admin app enabled).

6. Visit http://127.0.0.1:8000/ to participate in the poll.