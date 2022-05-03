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
rec1 = ("James","Butt","Benton, John B Jr","6649 N Blue Gum St",\
	   "New Orleans","Orleans","LA","70116","504-621-8927","504-845-1427","jbutt@gmail.com","http://www.bentonjohnbjr.com")
rec2 = ("Josephine","Darakjy","Chanay, Jeffrey A Esq",\
	   "4 B Blue Ridge Blvd","Brighton","Livingston","MI","48116","810-292-9388","810-374-9840","josephine_darakjy@darakjy.org","http://www.chanayjeffreyaesq.com")
rec3 = ("Art","Venere","Chemel, James L Cpa","8 W Cerritos Ave\
	   #54","Bridgeport","Gloucester","NJ","08014","856-636-8749","856-264-4130","art@venere.org","http://www.chemeljameslcpa.com")
records = [rec1, rec2, rec3]

try:
    cursor = connection.cursor()
    cursor.executemany(sql, records)
    connection.commit()
    print(cursor.rowcount, "records inserted successfully into Person table")
    cursor.close()

except mysql.connector.Error as error:
    print("Failed to insert records into Person table {}".format(error))

finally:
    if connection.is_connected():
        connection.close()
        print("MySQL connection is closed")
