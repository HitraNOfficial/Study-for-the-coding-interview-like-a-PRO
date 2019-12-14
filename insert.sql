USE testdb;

INSERT INTO CATEGORY (name, parent_id) 
VALUES ("design", null);

INSERT INTO CATEGORY (name, parent_id) 
VALUES ("patterns", (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "design") as cid)); -- for some reason 1 select doesn't work https://stackoverflow.com/questions/45494/mysql-error-1093-cant-specify-target-table-for-update-in-from-clause
INSERT INTO CATEGORY (name, parent_id) 
VALUES ("creational", (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "patterns") as cid));
INSERT INTO CATEGORY (name, parent_id) 
VALUES ("structural", (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "patterns") as cid));
INSERT INTO CATEGORY (name, parent_id) 
VALUES ("behavioral", (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "patterns") as cid));

---------------------------- DESIGN PRINCIPLES -------------------------------
INSERT INTO CATEGORY (name, parent_id) 
VALUES ("principles", (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "design") as cid));

INSERT INTO QUESTION (question_text, difficulty, category_id)
VALUES ("Define Single Responsibility Principle",
		1,
        (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "principles") as cid));
INSERT INTO ANSWER (answer_text, correct_answer, question_id) 
VALUES ("Class, package, method should only have one reason to change",
		true,
        (SELECT id FROM (SELECT ID FROM QUESTION WHERE question_text = "Define Single Responsibility Principle") as qid));

INSERT INTO QUESTION (question_text, difficulty, category_id)
VALUES ("Define Open Closed Principle",
		1,
        (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "principles") as cid));
INSERT INTO ANSWER (answer_text, correct_answer, question_id) 
VALUES ("Software entities should be open for extension but closed for modification. Example is area method (you only need to override it if you need different calculation)",
		true,
        (SELECT id FROM (SELECT ID FROM QUESTION WHERE question_text = "Define Open Closed Principle") as qid));

INSERT INTO QUESTION (question_text, difficulty, category_id)
VALUES ("Define Liskov Substitution Principle",
		1,
        (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "principles") as cid));
INSERT INTO ANSWER (answer_text, correct_answer, question_id) 
VALUES ("Subtypes must be substitutable for their base types. Use composition instead of inheritence.",
		true,
        (SELECT id FROM (SELECT ID FROM QUESTION WHERE question_text = "Define Liskov Substitution Principle") as qid));

INSERT INTO QUESTION (question_text, difficulty, category_id)
VALUES ("Define Interface Segregation Principle",
		1,
        (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "principles") as cid));
INSERT INTO ANSWER (answer_text, correct_answer, question_id) 
VALUES ("Dependency of one class to another should depend on the smallest possible interface. Clients should not be forced to implement interfaces they do not use. Instead of one fat interface many small interfaces are preferred based on groups of methods, each one serving one submodule",
		true,
        (SELECT id FROM (SELECT ID FROM QUESTION WHERE question_text = "Define Interface Segregation Principle") as qid));

INSERT INTO QUESTION (question_text, difficulty, category_id)
VALUES ("Define Dependency Inversion Principle",
		1,
        (SELECT id FROM (SELECT ID FROM CATEGORY WHERE NAME = "principles") as cid));
INSERT INTO ANSWER (answer_text, correct_answer, question_id) 
VALUES ("Depend upon abstractions (interfaces) not upon concrete classes",
		true,
        (SELECT id FROM (SELECT ID FROM QUESTION WHERE question_text = "Define Dependency Inversion Principle") as qid));