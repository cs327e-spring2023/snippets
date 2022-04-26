import psycopg

host = '<your_ip>'
password = '<your_password>'
url = "dbname='postgres' user='postgres' host={} port=5432 password={}".format(host, password)

conn = psycopg.connect(url)

print(conn)

sql = "INSERT INTO load_testing.Person (first_name, last_name, company, address, city, county, state, zip, phone_1,\
       phone_2, email, web) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
rec = ("James","Butt","Benton, John B Jr","6649 N Blue Gum St",\
	  "New Orleans","Orleans","LA","70116","504-621-8927","504-845-1427","jbutt@gmail.com","http://www.bentonjohnbjr.com")

try:
    with conn.cursor() as cur:
        cur.execute(sql, rec)
        conn.commit()
        print(cur.rowcount, "Record inserted successfully into Person table")
        cur.close()

except psycopg.errors.OperationalError as error:
    print("Failed to insert record into Person table {}".format(error))

finally:
    conn.close()
    print("Postgres connection is closed")
