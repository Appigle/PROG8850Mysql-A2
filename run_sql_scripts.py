import mysql.connector
from mysql.connector import Error

# Database connection configuration
config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'Secret5555',  # Update if your password is different
    'autocommit': True
}

# List of SQL script files to execute
sql_files = [
    'sql/project.sql',
    'sql/add_departments.sql'
]


def execute_sql_script(cursor, script_path):
    print(f"\nExecuting script: {script_path}")
    with open(script_path, 'r') as file:
        sql_commands = file.read()
    # Split commands by semicolon, but ignore semicolons in comments or strings
    # This is a simple split, not a full SQL parser
    commands = [cmd.strip() for cmd in sql_commands.split(';') if cmd.strip()]
    for command in commands:
        try:
            cursor.execute(command)
            print(f"SUCCESS: {command[:60]}...")
        except Error as e:
            print(f"ERROR: {e}\nCOMMAND: {command[:60]}...")


def main():
    try:
        connection = mysql.connector.connect(**config)
        cursor = connection.cursor()
        for sql_file in sql_files:
            execute_sql_script(cursor, sql_file)
        cursor.close()
        connection.close()
        print("\nAll scripts executed.")
    except Error as e:
        print(f"Database connection error: {e}")


if __name__ == "__main__":
    main()
