import psycopg2
from config import host, user, password, db_name
import csv
import logging

def to_csv():

    logging.basicConfig(
        level=logging.DEBUG,
        filename="mylog.csv",
        format="%(asctime)s - %(module)s - %(levelname)s - %(funcName)s: %(lineno)d - %(message)s",
        datefmt='%d-%m-%y %H:%M:%S',
    )

    try:
        connection = psycopg2.connect(host=host, user=user, password=password, database=db_name)

        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM dm.dm_f101_round_f")

            column_names = []

            for row in cursor.description:
                column_names.append(row[0])

            with open('dm_f101_round_f.csv', 'w', newline='') as filename:
                write_filename = csv.writer(filename, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
                write_filename.writerow(column_names)
                for row in cursor:
                    write_filename.writerow(row)

            connection.commit()
            print('[INFO] Connection commit')
            logging.info('Connection commit')

    except Exception as ex:
        print('[INFO] Error while working', ex)
        logging.exception("ex")

    finally:
        if connection:
            connection.close()
            print('[INFO] Connection closed')
            logging.info('Connection closed')


to_csv()