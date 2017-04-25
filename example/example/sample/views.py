from django.shortcuts import render
from . import models

# Create your views here.
def thumbnail_list(request):
    return render(request, 'sample/thumbnails.html', {
        'files': models.FileUpload.objects.all()
    })
