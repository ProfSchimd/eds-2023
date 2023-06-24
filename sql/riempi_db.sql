INSERT INTO "utente"
VALUES
    ("alice", "p@ssw0rd", "alice@iit.edu", 0),
    ("bob", "s3cret", "bob@iit.edu", 1),
    ("charlie", "p4ssword", "charlie@iit.edu", 1),
    ("daisy", "pass1234", "daisy@iit.edu", 1),
    ("edward", "myP@ss", "edward@cz.it", 0),
    ("frank", "p@ssword123", "frank@cz.it", 1),
    ("grace", "qwerty123", "grace@cz.it", 1),
    ("harry", "123abc!", "harry@cz.it", 1),
    ("isabella", "passw0rd", "isabella@myschool.org", 1),
    ("jack", "s3cr3t!", "jack@myschool.org", 1),
    ("kate", "il0vepython", "kate@myschool.org", 1),
    ("lucas", "passw0rd123", "lucas@myschool.org", 1),
    ("molly", "abc123!!", "molly@myschool.org", 1),
    ("nathan", "passw0rd456", "nathan@myschool.org", 1),
    ("olivia", "p@ssw0rd!", "olivia@myschool.org", 0),
    ("peter", "qwertyp@ss", "peter@myschool.org", 1),
    ("quincy", "12345abc!", "quincy@myschool.org", 1),
    ("rachel", "p@ssword789", "rachel@myschool.org", 1),
    ("sam", "il0vecoding", "sam@myschool.org", 1),
    ("tina", "p4ssw0rd!", "tina@myschool.org", 0),
    ("victor", "abc987!!", "victor@myschool.org", 1),
    ("wendy", "p@ssw0rd123", "wendy@myschool.org", 1),
    ("xavier", "qwerty@123", "xavier@myschool.org", 1),
    ("yvonne", "il0veprogramming", "yvonne@myschool.org", 1),
    ("zeus", "p@ssw0rd!!", "zeus@myschool.org", 1),
    ("amy", "s3cr3t123", "amy@example.com", 0),
    ("ben", "myp4ss", "ben@example.com", 1),
    ("chloe", "il0vepython!", "chloe@example.com", 1),
    ("david", "p@ssw0rd789", "david@example.com", 1),
    ("emma", "abc123456!", "emma@example.com", 1);

INSERT INTO "classe" VALUES
	(1, "alice", "1A", "matematica", NULL),
	(2, "alice", "2A", "matematica", NULL),
	(3, "olivia", "1A", "fisica", NULL),
	(4, "tina", "3B", "informatica", NULL),
	(5, "tina", "4B", "informatica", NULL),
	(6, "tina", "5B", "informatica", NULL),
	(7, "edward", "1B", "fisica", NULL),
	(8, "edward", "2B", "fisica", NULL),
	(9, "amy", "3B", "inglese", NULL),
	(10, "amy", "5C", "inglese", NULL);

INSERT INTO "iscrizione" VALUES
	("daisy", 1),
	("daisy", 3),
	("xavier", 1),
	("xavier", 3),
	("david", 1),
	("david", 3),
	("bob", 7),
	("sam", 7),
	("chloe", 7),
	("wendy", 6),
	("quincy", 6),
	("harry", 6),
	("emma", 2);

INSERT INTO "argomento" VALUES
	(1, "triangoli"),
	(2, "legge di Ohm"),
	(3, "verismo"),
	(4, "database"),
	(5, "past perfect"),
	(6, "giovanni verga"),
	(7, "polinomi"),
	(8, "equazioni");

INSERT INTO "videogioco" VALUES
	(1, "Trivial Pursuit Triangle", "Vinci monete rispondendo alle domande sui triangoli", 100, 1, NULL, NULL, NULL),
	(2, "Trivial Pursuit Polynomials", "Vinci monete rispondendo alle domande sui polinomi", 100, 7, NULL, NULL, NULL),
	(3, "Resist!", "Vinci la corrente usando tutta la potenza, gioco ad alta tensione", 30, 2, NULL, NULL, NULL),
	(4, "Verità o pegno", "Rispondi correttamente alle domande sul verismo o paga un pegno", 65, 3, NULL, NULL, NULL),
	(5, "SQuest", "Scopri il mondo di SQL sfidando i campioni", 50, 4, NULL, NULL, NULL),
	(6, "ERiddle", "Risolvi rompicapi su diagrammi ER", 91, 4, NULL, NULL, NULL);

INSERT INTO "catalogo_classe" VALUES
	(1, 1),
	(2, 2),
	(1, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(10, 4),
	(10, 6);


INSERT INTO "svolge_gioco" VALUES
	(1, 1, "daisy", NULL),
	(1, 1, "xavier", 67),
	(2, 2, "emma", 100),
	(1, 3, "daisy", 29),
	(6, 4, "wendy", 65),
	(6, 4, "quincy", 65),
	(6, 4, "harry", 0),
	(6, 6, "wendy", NULL),
	(6, 6, "harry", 50),
	(5, 6, "wendy", 23),
	(5, 6, "quincy", 15);

INSERT INTO "feedback" VALUES
	("daisy", 1, 3, "Poco divertente, difficoltà media"),
	("quincy", 4, 4, "Gioco interessante, contenuti meno..."),
	("harry", 5, 1, "Veramente troppo facile, nessun divertimento e non ho imparato nulla");
