import pymysql

print("1: Register for a course")
print("2: To list all students of a course)

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
        print e.message
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
        print e.message
