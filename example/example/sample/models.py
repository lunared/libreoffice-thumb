from django.db import models
from django.conf import settings
from django.core.files.images import ImageFile

import os


def thumb_path(filename):
    """
    Get the converted thumbnail file path of a document
    """
    filename = os.path.splitext(filename)[0]
    return os.path.join('thumbnails', os.path.basename(filename) + ".png")


class FileUpload(models.Model):
    file = models.FileField(upload_to='uploads/')

    def __str__(self):
        return self.file.name

    @property
    def thumbnail(self):
        path = thumb_path(self.file.name)
        return settings.MEDIA_URL + path
