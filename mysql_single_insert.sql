import mysql.connector

connection = mysql.connector.connect(
  host="<your_ip>",
  user="root",
  password="<your_password>",
  database="load_testing",
  autocommit=False
)

print(connection)

sql = "INSERT INTO Person (first_name, last_name, company, address, city, county, state, zip, phone_1, phone_2, email, web)\
	  VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
rec = ("James","Butt","Benton, John B Jr","6649 N Blue Gum St",\
	  "New Orleans","Orleans","LA","70116","504-621-8927","504-845-1427","jbutt@gmail.com","http://www.bentonjohnbjr.com")

try:
    cursor = connection.cursor()
    cursor.execute(sql, rec)
    connection.commit()
    print(cursor.rowcount, "Record inserted successfully into Person table")
    cursor.close()

except mysql.connector.Error as error:
    print("Failed to insert record into Person table {}".format(error))

finally:
    if connection.is_connected():
        connection.close()
        print("MySQL connection is closed")
