-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT  `students`.`id` as 'ID',
		`students`.`name` as 'Nome studente',
		`students`.`surname` as 'Cognome studente',
		`degrees`.`name` as 'Iscritto al corso di laurea'
FROM `students`
INNER JOIN `degrees`
	ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';
-- (68 RISULTATI TROVATI)

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT  `departments`.`name` as 'Dipartimento',
        `degrees`.`name` as 'Tipo di corso'
FROM `degrees`
INNER JOIN `departments`
	ON `departments`.`id` = `degrees`.`department_id`
WHERE (`departments`.`name` = 'Dipartimento di Neuroscienze'
AND `degrees`.`name` LIKE 'Corso di laurea Magistrale %');
-- (1 RISULTATO TROVATO)

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT  `teachers`.`id` AS 'ID',
        `teachers`.`name` AS 'Nome',
        `teachers`.`surname` AS 'Cognome',
		`course_teacher`.`course_id` AS 'ID del corso'
FROM `teachers`
INNER JOIN `course_teacher`
	ON `teachers`.`id` = `course_teacher`.`teacher_id`
WHERE `teachers`.`id` = '44';
-- (11 RISULTATI TROVATI)

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
-- relativo dipartimento, in ordine alfabetico per cognome e nome


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
-- superare ciascuno dei suoi esami