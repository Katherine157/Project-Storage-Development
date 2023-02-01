import psycopg2
from config import host, user, password, db_name
import schedule

def launch_account():
    try:
        connection = psycopg2.connect(host=host, user=user, password=password, database=db_name)

        with connection.cursor() as cursor:
            cursor.execute("CALL dm.launch_fill_account()")

            connection.commit()

    except Exception as ex:
        print("[INFO] Error while working", ex)
    finally:
        if connection:
            connection.close()
            print("[INFO] Connection closed")

def main():
    schedule.every(4).seconds.do(launch_account)
    # schedule.every().day.do(launch_account)
    while True:
        schedule.run_pending()


if __name__ == '__main__':
    main()