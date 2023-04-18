from django.shortcuts import render, get_object_or_404
from rest_framework.decorators import api_view
from django.http import JsonResponse
from .models import Article, Comment
from .serializers import ArticleListSerializer
from rest_framework.response import Response
from rest_framework import status


# 전체 조회, 생성
# @api_view: 함수가 API VIEW로 동작하도록 변환
#    - 메소드 제한 기능
#    - HttpResponce 대신 Json이나 DRF의 Response 객체 반환 가능
@api_view(['GET', 'POST'])
def article_list(request):
    if request.method == 'POST':
        serializer = ArticleListSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data)
    
    # GET 이라면
    articles = Article.objects.all()
    # Serializer : 쉽게 말하면 원하는 현태로 포장하는 것
    serializer = ArticleListSerializer(articles, many=True)
    return Response(serializer.data)


# 상세 조회. 수정, 삭제
@api_view(['GET', 'PUT', 'DELETE'])
def article_detail(request, pk):
    article = get_object_or_404(Article,pk=pk)
    if request.method == 'PUT':
        # article instance를 파라미터로 전달
        serializer = ArticleListSerializer(article, data=request.data)
        # raise_exception: 유효성 검증 실패 시, 에러를 반환해줌
        if serializer.is_valid(raise_exception=True):
            serializer.save()
            return Response(serializer.data)
    elif request.method == 'DELETE':
        article.delete()
        return Response(serializer.status.HTTP_204_NO_CONTENT)
    

    serializer = ArticleListSerializer(article)
    return Response(serializer.data)
