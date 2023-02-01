import psycopg2
from config import host, user, password, db_name
import logging

def from_csv():

    logging.basicConfig(
        level=logging.DEBUG,
        filename="mylog.csv",
        format="%(asctime)s - %(module)s - %(levelname)s - %(funcName)s: %(lineno)d - %(message)s",
        datefmt='%d-%m-%y %H:%M:%S',
    )

    try:
        connection = psycopg2.connect(host=host, user=user, password=password, database=db_name)
        connection.autocommit = True

        with connection.cursor() as cursor:

            with open('dm_f101_round_f.csv', 'r') as f:
                next(f)
                cursor.execute(f'SET search_path TO dm')
                cursor.copy_from(f, 'dm_f101_round_f_v2', sep=';', null="")

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


from_csv()