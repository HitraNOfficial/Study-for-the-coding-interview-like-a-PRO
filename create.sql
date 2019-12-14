USE testdb;

CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INT,
    CONSTRAINT fk_category
    FOREIGN KEY (parent_id) REFERENCES category(id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS question (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text VARCHAR(255) NOT NULL,
    difficulty INT NOT NULL,
    category_id INT,
    CONSTRAINT fk_category_question
    FOREIGN KEY (category_id) REFERENCES category(id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS answer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    answer_text VARCHAR(10000) NOT NULL,
    correct_answer BOOLEAN DEFAULT false,
    question_id INT,
    CONSTRAINT fk_question
    FOREIGN KEY (question_id) REFERENCES question(id)
) ENGINE=INNODB;

