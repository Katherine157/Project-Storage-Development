import psycopg2
from config import host, user, password, db_name
import csv

def launch_to_csv():

    try:
        connection = psycopg2.connect(host=host, user=user, password=password, database=db_name)

        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM dm.return_min_max('12.01.2018')")

            column_names = []

            for row in cursor.description:
                column_names.append(row[0])

            with open('return_min_max.csv', 'w', newline='') as filename:
                write_filename = csv.writer(filename, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
                write_filename.writerow(column_names)
                for row in cursor:
                    write_filename.writerow(row)

            connection.commit()

    except Exception as ex:
        print("[INFO] Error while working", ex)
    finally:
        if connection:
            connection.close()
            print("[INFO] Connection closed")

launch_to_csv()