from django.contrib import admin

from .models import Utente, Classe, Videogioco, Argomento, SvolgeGioco, Feedback

admin.site.register(Utente)
admin.site.register(Classe)
admin.site.register(Videogioco)
admin.site.register(Argomento)
admin.site.register(SvolgeGioco)
admin.site.register(Feedback)
