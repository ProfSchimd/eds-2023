BEGIN TRANSACTION
CREATE TABLE "utente"(
	"Username" VARCHAR(128) PRIMARY KEY,
	-- Store only hashed password (fixed size 256 byte) --
	"Password" CHAR(256) NOT NULL,
	"Mail" VARCHAR(256) NOT NULL,
	-- 0 -> Docente, 1 -> Studente (default)
	"Ruolo" INT DEFAULT 1
);

CREATE TABLE "classe"(
	"IDClasse" INT PRIMARY KEY,
	"CreatoDa" VARCHAR(128) NOT NULL,
	"Nome" VARCHAR(128) NOT NULL,
	"Materia" VARCHAR(128) NOT NULL,
	"CodiceIscrizione" BLOB,
	FOREIGN KEY("CreatoDa") REFERENCES "utente"("username")
);

CREATE TABLE "iscrizione"(
	"Utente" VARCHAR(128) NOT NULL,
	"IDClasse" INT NOT NULL,
	PRIMARY KEY("Utente", "IDClasse"),
	FOREIGN KEY("Utente") REFERENCES "utente"("Username"),
	FOREIGN KEY("IDClasse") REFERENCES "classe"("IDClasse")
);

CREATE TABLE "argomento"(
	"IDArgomento" INT PRIMARY KEY,
	"Descrizione" VARCHAR(128) NOT NULL
);

CREATE TABLE "videogioco"(
	"IDGioco" INT PRIMARY KEY,
	"DescrizioneBreve" VARCHAR(160) NOT NULL,
	"Descrizione" BLOB,
	"Monete" INT NOT NULL,
	"Argomento" INT NOT NULL,
	"Immagine1" BLOB,
	"Immagine2" BLOB,
	"Immagine3" BLOB,
	FOREIGN KEY("Argomento") REFERENCES "argomento"("IDArgomento")
);

CREATE TABLE "catalogo_classe"(
	"IDClasse" INT NOT NULL,
	"IDGioco" INT NOT NULL,
	PRIMARY KEY("IDClasse", "IDGioco"),
	FOREIGN KEY("IDClasse") REFERENCES "classe"("IDClasse"),
	FOREIGN KEY("IDGioco") REFERENCES "videogioco"("IDGioco")
);

CREATE TABLE "svolge_gioco"(
	"IDGioco" INT NOT NULL,
	"IDClasse" INT NOT NULL,
	"Utente" VARCHAR(128) NOT NULL,
	"Monete" INT,
	PRIMARY KEY("IDGioco", "IDClasse", "Utente"),
	FOREIGN KEY("IDGioco") REFERENCES "videogioco"("IDGioco"),
	FOREIGN KEY("IDClasse") REFERENCES "classe"("IDClasse"),
	FOREIGN KEY("Utente") REFERENCES "utente"("Username")
);

CREATE TABLE "feedback"(
	"Utente" VARCHAR(128) NOT NULL,
	"IDGioco" INT NOT NULL,
	"Punteggio" INT CHECK (Punteggio>=1 AND Punteggio<=5),
	"Descrizione" VARCHAR(160),
	PRIMARY KEY("Utente", "IDGioco"),
	FOREIGN KEY("Utente") REFERENCES "utente"("Username"),
	FOREIGN KEY("IDGioco") REFERENCES "gioco"("IDGioco")
);


COMMIT TRANSACTION 