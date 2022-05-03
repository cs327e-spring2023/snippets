import psycopg2 as psycopg, psycopg2.extras as p

host = '<your_ip>'
password = '<your_password>'
url = "dbname='postgres' user='postgres' host={} port=5432 password={}".format(host, password)

conn = psycopg.connect(url)

print(conn)

sql = "INSERT INTO load_testing.Person (first_name, last_name, company, address, city, county, state, zip, phone_1,\
       phone_2, email, web) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
rec1 = ("James","Butt","Benton, John B Jr","6649 N Blue Gum St",\
	  "New Orleans","Orleans","LA","70116","504-621-8927","504-845-1427","jbutt@gmail.com","http://www.bentonjohnbjr.com")
rec2 = ("Josephine","Darakjy","Chanay, Jeffrey A Esq","4 B Blue Ridge Blvd","Brighton","Livingston","MI","48116",\
        "810-292-9388","810-374-9840","josephine_darakjy@darakjy.org","http://www.chanayjeffreyaesq.com")
rec3 = ("Art","Venere","Chemel, James L Cpa","8 W Cerritos Ave #54","Bridgeport","Gloucester","NJ","08014",\
        "856-636-8749","856-264-4130","art@venere.org","http://www.chemeljameslcpa.com")

records = [rec1, rec2, rec3]

try:
    cur = conn.cursor()
    p.execute_batch(cur, sql, records)
    conn.commit()
    print("records inserted successfully into Person table")
        
except psycopg.errors.OperationalError as error:
    print("Failed to insert record into Person table {}".format(error))

finally:
    cur.close()
    conn.close()
    print("Postgres connection is closed")
