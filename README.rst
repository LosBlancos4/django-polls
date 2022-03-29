django-polls/README.rst¶
=====
Polls
=====

Polls is a Django app to conduct web-based polls. For each question,
visitors can choose between a fixed number of answers.

Detailed documentation is in the "docs" directory.

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

3. Init sqlite database by running
   python3 -m create_db.py

3. Run ``python manage.py migrate`` to create the polls models.

4. Start the development server and visit http://127.0.0.1:8000/admin/
   to create a poll (you'll need the Admin app enabled).

5. Visit http://127.0.0.1:8000/ to participate in the poll.