-- 
-- Query (a) 
-- l’elenco in ordine alfabetico dei giochi classificati
-- per uno specifico argomento;
--

SELECT IDGioco, DescrizioneBreve, A.Descrizione
FROM videogioco as V, argomento as A
WHERE V.Argomento = A.IDArgomento
ORDER BY A.Descrizione;

--
-- Query (b)
-- la classifica degli studenti di una certa classe virtuale,
-- in base alle monete raccolte per un certo gioco;
--

SELECT U.Username, SUM(S.Monete)
FROM utente as U, svolge_gioco as S 
WHERE U.Username = S.Utente
GROUP BY U.Username
ORDER BY SUM(S.Monete) DESC;

--
-- Query (c)
-- il numero di classi in cui è utilizzato ciascun videogioco
-- del catalogo;
--
SELECT C.IDGioco, V.DescrizioneBreve, COUNT(C.IDGioco) as "NumeroUtilizzi"
FROM videogioco as V, catalogo_classe as C
WHERE V.IDGioco = C.IDGioco
GROUP BY C.IDGioco;

--
-- Query I (Parte 2)
-- classifica generale degli studenti di una certa classe virtuale,
-- in base alle monete raccolte in tutti i videogiochi di quella classe.
--
SELECT U.Username, SUM(S.monete)
FROM Utente as U, svolge_gioco as S
WHERE U.Username = S.Utente AND S.IDClasse = 6
GROUP BY S.Utente
ORDER BY (SUM(S.monete)) DESC;
