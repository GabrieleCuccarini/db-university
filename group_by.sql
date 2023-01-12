-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id),YEAR(`enrolment_date`) as 'Anno iscrizione'
FROM `students`
GROUP BY YEAR(`enrolment_date`);

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) as 'Insegnanti nella sede', 
	`office_address` as 'Indirizzo sede'
FROM `teachers`
GROUP BY `Indirizzo sede`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`,AVG(`vote`) as `voto`
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT  (`department_id`) AS 'ID Dipartimento',
		COUNT(`department_id`) AS 'Corsi nel dipartimento'
FROM `degrees`
GROUP BY(`department_id`);