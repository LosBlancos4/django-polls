from django.http import HttpResponseRedirect, Http404
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse
from django.views import generic
from django.utils import timezone
from django.contrib.auth.decorators import login_required
import sqlite3
from django.views.decorators.csrf import csrf_protect, csrf_exempt

from django.contrib.auth.models import User
from .models import Choice, Question, Account, Donation

class IndexView(generic.ListView):
    template_name = "polls/index.html"
    context_object_name = "latest_question_list"

    def get_queryset(self):
        """
        Return the last five published questions (not including those set to be
        published in the future).
        """
        return Question.objects.filter(pub_date__lte=timezone.now()).order_by(
            "-pub_date"
        )[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = "polls/detail.html"

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Question.objects.filter(pub_date__lte=timezone.now())


class ResultsView(generic.DetailView):
    model = Question
    template_name = "polls/results.html"


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST["choice"])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(
            request,
            "polls/detail.html",
            {
                "question": question,
                "error_message": "You didn't select a choice.",
            },
        )
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse("polls:results", args=(question.id,)))


def detail(request, question_id):
    try:
        question = Question.objects.get(pk=question_id)
    except Question.DoesNotExist:
        raise Http404("Question does not exist")
    return render(request, "polls/detail.html", {"question": question})

def addView(request):
    print(request.user)
    print(request.POST.get("feedback"))
    
    #ccount = Account(owner=request.user, feedback=request.POST.get("feedback"))
    #account.save()

    conn = sqlite3.connect("./db.sqlite3")
    print(conn)
    cursor = conn.cursor()
    print("INSERT INTO polls_account(owner_id, feedback) VALUES(%d,%s)" % (request.user.id, request.POST.get("feedback")))
    cursor.executescript("INSERT INTO polls_account(owner_id, feedback) VALUES(%d,'%s')" % (request.user.id, request.POST.get("feedback")))
    conn.commit()
    print("Record inserted successfully into polls_account table ", cursor.rowcount)
    cursor.close()

    return redirect('/')

def transferView(request):
    print(request.GET.get('amount'))
    amount = int(request.GET.get('amount'))
    don = Donation.objects.get(pk=1)
    don.donations += amount
    don.save()

    return redirect('/')
