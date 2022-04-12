import pymysql

print("Hello, welcome to Noodle")
print("Select your role from the list given below")
print("1: Student")
print("2: Professor")
print("3: TA")
print("4: Academic Administrator")
print("5: None of the above")
print("0: To quit")

option1 = input()
connection = pymysql.connect(host="localhost",user="root",passwd="4",database="AcadWorks",port=30306)
cursor = connection.cursor()

while(1):
    if(option1 == '1'):
        student_email = input("Enter your institute e-mail")
        print("1: Register for a course")
        print("2: The progress in a particular course")
        print("3: All the work you have before a specific date")
        print("4: All corrections given by now\n")
        
        option = input("Select an option from above displayed: ")
        if(option == '1'):
            course_id = input("Please enter the course ID, you want to register\n")

            # Print the pre-requisites

            querry_pre = '''
            SELECT prerequisite
            FROM prerequisites
            WHERE course = %s
            '''
            querry_pre = querry_pre%(course_id)

            try:
                cursor.execute(querry_pre)
                print("Course\tPre-requisite\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\n"%(row[0],row[1]));
                flag = input("Did you already take the above courses.\nEnter 1 for yes and 0 for no:")
                if(flag == '0'):
                    print("You can't register for these courses, Please take the Pre-requisites mentioned")
                else:
                    insert = '''INSERT INTO Studentship(Attendence,student_email,Course_ID)
                    VALUES (0,%s,%s)'''
                    insert = insert%(student_email,course_id)
                    try:
                        cursor.execute(insert)
                        connection.commit()
                    except Exception as e:
                        print(e.message)
            except Exception as e:
                print("Can't finish the querry : ")
                print(e.message)
        elif(option == '2'):
            course_id = input("Enter the course_id you want to check the progress")

            progress_A = '''SELECT A1.student_email,A1.Assignment_file,A1.ta_email, A1.score,
                            A1.verified,A1.remarks FROM ASSIGNMENT_EVALS AS A1,
                            ASSIGNMENT AS A2
                            WHERE (A1.student_email = %s) AND (A1.Assignment_file = A2.Assignment_file)
                            AND (A2.Course_ID = %s)'''%(student_email,course_id)
            progress_Q = '''SELECT A1.student_email,A1.date,A1.ta_email, A1.score,
                            A1.verified,A1.remarks FROM QUIZ_EVALS AS A1,
                            QUIZ AS A2
                            WHERE (A1.student_email = %s) AND (A1.date = A2.Date)
                            AND (A2.Course_ID = %s)'''%(student_email,course_id)
            progress_P = '''SELECT A1.student_email,A1.Project_file,A1.ta_email, A1.score,
                            A1.verified,A1.remarks FROM PROJECT_EVALS AS A1,
                            PROJECT AS A2
                            WHERE (A1.student_email = %s) AND (A1.Project_file = A2.Project_file)
                            AND (A2.Course_ID = %s)'''%(student_email,course_id)

            try:
                cursor.execute(progress_A)
                print("student_email\tAssignment_file\tta_email\tscore\tverified\tRemarks\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4],row[5]))
            except Exception as e:
                print(e.message)

            try:
                cursor.execute(progress_Q)
                print("student_email\tDate\tta_email\tscore\tverified\tRemarks\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4],row[5]))
            except Exception as e:
                print(e.message)
            try:
                cursor.execute(progress_P)
                print("student_email\tProject_file\tta_email\tscore\tverified\tRemarks\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4],row[5]))
            except Exception as e:
                print(e.message)
        elif(option == '3'):
            date_input = int(input("Enter date(in yyyymmdd format) before you which you want to know your deadlines"))

            work_P = ''' SELECT * FROM Project
                        WHERE End_Date <= %d AND Course_ID IN
                        (SELECT Course_ID FROM Studentship
                        WHERE student_email = %s)'''%(date_input,student_email)
            work_Q = ''' SELECT * FROM QUIZ
                        WHERE End_Date <= %d AND Course_ID IN
                        (SELECT Course_ID FROM Studentship
                        WHERE student_email = %s)'''%(date_input,student_email)
            work_A = ''' SELECT * FROM Assignment
                        WHERE End_Date <= %d AND Course_ID IN
                        (SELECT Course_ID FROM Studentship
                        WHERE student_email = %s)'''%(date_input,student_email)

            try:
                cursor.execute(work_P)
                print("Course_ID\tProject_file\tStart_Date\tEnd_date\tTeam_size\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4]))
            except Exception as e:
                print(e.message)
            try:
                cursor.execute(work_Q)
                print("Course_ID\tDate\tPlatform\tStart_time\tEnd_time\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4]))
            except Exception as e:
                print(e.message)

            try:
                cursor.execute(work_A)
                print("Course_ID\tAssignment_file\tStart_Date\tEnd_date\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3]))
            except Exception as e:
                print(e.message)


        elif(option == '4'):

            corrections_P = ''' SELECT * FROM PROJ_EVALS
                            WHERE score NOT NULL AND student_email = %s'''%student_email 
            corrections_Q = ''' SELECT * FROM QUIZ_EVALS
                            WHERE score NOT NULL AND student_email = %s'''%student_email 
            corrections_A = ''' SELECT * FROM ASSIGNMENT_EVALS
                            WHERE score NOT NULL AND student_email = %s'''%student_email 

            try:
                cursor.execute(corrections_P)
                print("student_email\tProject_file\tta_email\tscore\tverified\tRemarks\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4],row[5]))
            except Exception as e:
                print(e.message)
            try:
                cursor.execute(corrections_Q)
                print("student_email\tDate\tta_email\tscore\tverified\tRemarks\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4],row[5]))
            except Exception as e:
                print(e.message)
            try:
                cursor.execute(corrections_A)
                print("student_email\tAssignment_file\tta_email\tscore\tverified\tRemarks\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\t%s\t%s\t%s\t%s\n"%(row[0],row[1],row[2],row[3],row[4],row[5]))
            except Exception as e:
                print(e.message)

    elif(option1 == '2'):
        pass
    elif(option1 == '3'):
        pass
    elif(option1 == '4'):
        pass
    elif(option1 == '5'):
        print("1: Register for a course")
        print("2: To list all students of a course")

        option = input("Select an option from above displayed: ")

        if(option == '1'):
            course_id = input("Please enter the course ID, you want to know pre-requisites")


            querry_pre = '''
                SELECT prerequisite
                FROM prerequisites
                WHERE course = %s
                '''
            querry_pre = querry_pre%(course_id)

            try:
                cursor.execute(querry_pre)
                print("Course\tPre-requisite\n")
                results = cursor.fetchall()
                for row in results:
                    print("%s\t%s\n"%(row[0],row[1]));
            except Exception as e:
                print(e.message)
        elif(option == 2):
            course_id = input("Please enter the course ID, you want to list the students")

            querry_list = '''SELECT student_email
                            FROM Studentship
                            WHERE Course_ID = %s'''%(course_id)

            try:
                cursor.execute(querry_list)
                print("students")
                results = cursor.fetchall()
                for row in results:
                    print(row[0])
            except Exception as e:
                print(e.message)
    elif(option1 == '0'):
        connection.close()
        exit()
    else:
        print("Invalid role: Select the correct role from given options")

    option1 = input("Select a role")
