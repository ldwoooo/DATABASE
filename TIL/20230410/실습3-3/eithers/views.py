from django.shortcuts import render, redirect
from .models import Question, Comment
from .forms import QuestionForm, CommentForm
import random as ra

# Create your views here.
def index(request):
    questions = Question.objects.all()
    context = {
        'questions': questions,
    }
    return render(request, 'eithers/index.html', context)


def create(request):
    if request.method == 'POST':
        form = QuestionForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('eithers:index')
        
    # GET일 때 create.html을 사용자에게 보여줌
    form = QuestionForm()
    context = {
        'form': form,
    }
    return render(request, 'eithers/create.html', context)


def detail(request, question_pk):
    question = Question.objects.get(pk=question_pk)
    comments = question.comments.all()
    comment_form = CommentForm()
    context ={
        'question': question,
        'comment_form': comment_form,
        'comments': comments,
    }
    return render(request, 'eithers/detail.html', context)


# 댓글 생성
def comment(request, question_pk):
    question = Question.objects.get(pk=question_pk)
    form = CommentForm(request.POST)
    if form.is_valid():
        # 사용자가 직접 question 을 입력하지 않으므로
        # views.py 에서 지정해준 후 저장
        comment = form.save(commit=False)
        comment.question = question
        comment.save()
        return redirect('eithers:detail', question_pk)
    
def random(request):
    # 있는가 없는가? 가 제일 중요.
    count = Question.objects.count()
    if count <= 0:
        return redirect('eithers:index')
    
    # 첫 번째 방법 - 가장 쉬운 방법
    # 전체를 가져와서 장고가 필터링 해주는 방법
    # question = ra.choice(Question.objects.all())
    # return redirect('eithers:detail', question.id)

    # 구글링
    # DB가 정렬 후 하나만 장로고 보내줌
    # 훨씬 빠름
    question = Question.objects.order_by('?').first()
    return redirect('eithers:detail', question.id)