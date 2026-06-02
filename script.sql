-- Script de criação da tabela

DROP TABLE IF EXISTS tb_students;
CREATE TABLE tb_students(
	student_id VARCHAR PRIMARY KEY,
	age INT,
	gender INT,
	hs_type INT,
	scholarship INT,
	work INT,
	activity INT,
	partner INT,
	salary INT,
	transport INT,
	living INT,
	mother_edu INT,
	father_edu INT,
	n_sibilings INT,
	kids INT,
	mother_job INT,
	father_job INT,
	study_hrs INT,
	read_freq INT,
	read_freq_sci INT,
	attend_dept INT,
 	impact INT,
	attend INT,
	prep_study INT,
	prep_exam INT,
	notes INT,
	listens INT,
	likes_discuss INT,
	classroom INT,
	cuml_gpa INT,
	exp_gpa INT,
	course_id INT,
	grade INT
);

-- Agora, importar a base de dados sem tirar o id_student

SELECT * FROM tb_students;

-- Executar esse comando: (Vamos tirar o id do tipo VARCHAR )
ALTER TABLE tb_students DROP COLUMN student_id;

-- Agora rodar esse comando abaixo. Adicionar o id correto (tipo SERIAL):
ALTER TABLE tb_students ADD COLUMN id_student SERIAL PRIMARY KEY;