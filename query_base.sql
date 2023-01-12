-- 1. Selezionare tutti gli studenti nati nel 1990(160)
SELECT * FROM `students`
WHERE YEAR(date_of_birth) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti(160)
SELECT * FROM `courses`
WHERE `cfu`>10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni(160)
SELECT * FROM `students`
WHERE TIMESTAMPDIFF(year, date_of_birth, CURRENT_DATE()) >= 30;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea(160)
SELECT * FROM `courses`
WHERE `period`='I semestre'
	AND `year`='1';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams`
WHERE `hour` > '14:00:00'
	AND `date` = '2020-06-20';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * FROM `degrees`
WHERE `level` = 'magistrale';

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT * FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT * FROM `teachers`
WHERE `phone` IS NULL;


--- DA QUI IN POI SONO APPUNTI DI ESEMPI FATTI A LEZIONE


--  Trovare la media voto per singolo esame
SELECT `exam_id`, AVG(`vote`) as `voto`
FROM `exam_student`
GROUP BY `exam_id`;

--  Esperimenti sul join. Il risultato sarà 3 colonne, name+surnamente di students + il name dalla tabella degrees
SELECT `students`.`name` as `first_name`,
	   `students`.`surname` as `last_name`,
       `degrees`.`name` as `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`;

-- Selezionare le informazioni sul corso con id = 144, con tutti i relativi appelli d’esame
SELECT * 
FROM `courses`
INNER JOIN `exams`
ON `courses`.`id` = `exams`.`course_id`
WHERE `courses`.`id` = 144;

-- Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto
-- dell'Economia (Dipartimento di Scienze politiche, giuridiche e studi internazionali)
SELECT `degrees`.*, `departments`.`name` AS `Dipartimento`
FROM `degrees`
INNER JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia";

-- Selezionare gli esame della laurea magistrale in fisica al 1° anno che iniziano dopo le 14
SELECT `degrees`.`name` as 'Corso di Laurea',
	`courses`.`name` as 'Corso',
	`courses`.`year` as 'Anno',
    `exams`.`hour`
FROM `degrees`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`department_id`
INNER JOIN `exams`
	ON `exams`.`course_id` = `courses`.`id`
WHERE `degrees`.`name` = "Corso di laurea magistrale in Fisica"
	AND `courses`.`year` = "1"
    AND `exams`.`hour` > '14:00:00';

-- Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere
SELECT `degrees`.`name` AS `corso_laurea`,
		`courses`.`name` AS `insegnamento`,
        `teachers`.`name` AS `nome_insegnante`,
        `teachers`.`surname` AS `cognome_insegnante`
FROM `degrees`
INNER JOIN `courses`
	ON `courses`.`degree_id` = `degrees`.`id`
INNER JOIN `course_teacher`
	ON `course_teacher`.`course_id` = `courses`.`id`
INNER JOIN `teachers`
	ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"
ORDER BY `cognome_insegnante`;

--CERCARE "HOW TO FILTER AFTER GROUP BY PER FARE IL BONUS"