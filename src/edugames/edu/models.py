from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

class Utente(models.Model):
    class Roles(models.IntegerChoices):
        DOCENTE = 0
        STUDENTE = 1
    username = models.CharField(max_length=128, unique=True)
    password = models.CharField(max_length=256)
    mail = models.EmailField(unique=True)
    ruolo = models.IntegerField(choices=Roles.choices)
    svolge = models.ManyToManyField("Videogioco", through="SvolgeGioco")
    valuta = models.ManyToManyField("Videogioco", through="Feedback", related_name="utente_feedback")
    
    def __str__(self) -> str:
        return f"{self.username} - {self.mail} [{self.get_ruolo_display()}]"

class Argomento(models.Model):
    descrizione = models.CharField(max_length=128, unique=True)
    
    def __str__(self):
        return self.descrizione
    
    
class Videogioco(models.Model):
    descrizione_breve = models.CharField(max_length=160)
    descrizione = models.TextField()
    monete = models.IntegerField()
    argomento = models.ForeignKey(Argomento, on_delete=models.CASCADE)
    immagini_1 = models.URLField(blank=True, default="")
    immagini_2 = models.URLField(blank=True, default="")
    immagini_3 = models.URLField(blank=True, default="")
    
    def __str__(self) -> str:
        return f"{self.descrizione_breve} (monete={self.monete}) #{self.argomento}"
    
class Classe(models.Model):
    creata_da = models.ForeignKey(Utente, on_delete=models.CASCADE, related_name="classe_creator")
    nome = models.CharField(max_length=128)
    materia = models.CharField(max_length=128)
    url = models.URLField()
    # Possiamo usare questo in quanto la tabella "iscrizione"
    # non ha campi di relazioni
    iscrizione = models.ManyToManyField(Utente, blank=True)
    catalogo = models.ManyToManyField(Videogioco, blank=True)
    
    def __str__(self) -> str:
        return f"{self.nome} {self.materia}"
    
    
class SvolgeGioco(models.Model):
    utente = models.ForeignKey(Utente, on_delete=models.CASCADE)
    classe = models.ForeignKey(Classe, on_delete=models.CASCADE)
    gioco = models.ForeignKey(Videogioco, on_delete=models.CASCADE)
    monete = models.IntegerField(null=True)
    
class Feedback(models.Model):
    utente = models.ForeignKey(Utente, on_delete=models.CASCADE)
    gioco = models.ForeignKey(Videogioco, on_delete=models.CASCADE)
    punteggio = models.IntegerField(
        default=3,
        validators=[MinValueValidator(1), MaxValueValidator(5)]
    ),
    descrizione = models.CharField(max_length=160)

