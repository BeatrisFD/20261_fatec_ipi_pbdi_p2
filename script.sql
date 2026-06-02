-- 3 Resultado em função dos estudos
-- Escreva um stored procedure que disponibiliza, utilizando um parâmetro em modo OUT, o
-- número de alunos aprovados dentre aqueles que estudam sozinhos

CREATE OR REPLACE PROCEDURE sp_alunos_alones_aprovados(
    OUT quantidade INT
) LANGUAGE plpgsql
AS $$
DECLARE
    cur_students CURSOR FOR SELECT grade, prep_study FROM tb_students;
    tupla RECORD;
BEGIN
    quantidade := 0;
    OPEN cur_students;
    FETCH cur_students INTO tupla;
    WHILE FOUND LOOP
        IF tupla.grade != 0 AND tupla.prep_study = 1 THEN
            quantidade := quantidade + 1;
        END IF;
        FETCH cur_students INTO tupla;
    END LOOP;
    CLOSE cur_students;   
END;
$$;

DO $$
DECLARE
    quantidade_alunos_soz INT;
BEGIN
    CALL sp_alunos_alones_aprovados(quantidade_alunos_soz);
    RAISE NOTICE 'A quantidade de alunos aprovados que estudam sozinhos é: %',quantidade_alunos_soz;
END;
$$;

-- 2 Resultado em função da formação dos pais
-- Escreva um stored procedure que exibe o número de alunos aprovados e cujos pais são
-- ambos PhDs.
CREATE OR REPLACE PROCEDURE sp_aprovados()
LANGUAGE plpgsql
AS $$
DECLARE
    v_grade INT;
    v_mother_edu INT;
    v_father_edu INT;
    v_count INT = 0;
    c_students CURSOR FOR SELECT grade, mother_edu, father_edu FROM tb_students;
BEGIN
    OPEN c_students;
    LOOP
        FETCH c_students INTO v_grade, v_mother_edu, v_father_edu;
        EXIT WHEN NOT FOUND;
            IF v_grade >= 1 AND v_mother_edu = 6 AND v_father_edu = 6 THEN
                v_count := v_count + 1;
            END IF;
    END LOOP;
    RAISE NOTICE 'Alunos: %', v_count;
    CLOSE c_students;
END;
$$;

CALL sp_aprovados();

-- Script de criação da tabela
-- DROP TABLE IF EXISTS tb_students;
-- CREATE TABLE tb_students(
-- 	student_id VARCHAR PRIMARY KEY,
-- 	age INT,
-- 	gender INT,
-- 	hs_type INT,
-- 	scholarship INT,
-- 	work INT,
-- 	activity INT,
-- 	partner INT,
-- 	salary INT,
-- 	transport INT,
-- 	living INT,
-- 	mother_edu INT,
-- 	father_edu INT,
-- 	n_sibilings INT,
-- 	kids INT,
-- 	mother_job INT,
-- 	father_job INT,
-- 	study_hrs INT,
-- 	read_freq INT,
-- 	read_freq_sci INT,
-- 	attend_dept INT,
--  	impact INT,
-- 	attend INT,
-- 	prep_study INT,
-- 	prep_exam INT,
-- 	notes INT,
-- 	listens INT,
-- 	likes_discuss INT,
-- 	classroom INT,
-- 	cuml_gpa INT,
-- 	exp_gpa INT,
-- 	course_id INT,
-- 	grade INT
-- );

-- -- Agora, importar a base de dados sem tirar o id_student

-- SELECT * FROM tb_students;

-- -- Executar esse comando: (Vamos tirar o id do tipo VARCHAR )
-- ALTER TABLE tb_students DROP COLUMN student_id;

-- -- Agora rodar esse comando abaixo. Adicionar o id correto (tipo SERIAL):
-- ALTER TABLE tb_students ADD COLUMN id_student SERIAL PRIMARY KEY;