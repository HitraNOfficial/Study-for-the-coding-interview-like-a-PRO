import sys
import voice_handler
from time import sleep
import mysql.connector

chosen_category = "principles"

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123password",
    database="testdb"
)

mycursor = mydb.cursor()

sql_category = "SELECT id FROM category WHERE name = %s"
mycursor.execute(sql_category, (chosen_category, ))
category_id = mycursor.fetchone() # this becomes a tuple

engine = voice_handler.init_engine()
voice = voice_handler.get_voice(engine)
voice_handler.speak("Let me prepare you to crush the coding interview", voice, engine)
voice_handler.speak("Current category is: " + chosen_category, voice, engine)

sql_question = "SELECT id, question_text FROM question WHERE category_id = %s"
mycursor.execute(sql_question, (category_id[0], ))
questions = mycursor.fetchall()

for curr_question in questions:
    voice_handler.speak("Question is: " + str(curr_question[1]), voice, engine)
    sql_answer = "SELECT answer_text FROM answer WHERE question_id = %s and correct_answer = %s"
    mycursor.execute(sql_answer, (curr_question[0], True))
    curr_answer = mycursor.fetchone()
    voice_handler.speak(str(curr_answer[0]), voice, engine)
    sleep(60)

