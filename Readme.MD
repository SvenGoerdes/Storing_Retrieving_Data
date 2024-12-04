# Storing and Retrieving Data 


## Folder structure:

__sql_scripts:__

* Contain our sql scripts. 
    * From creating the schema, insert data to updating certain tables. please use this folder.

__python_scripts:__

* Contain our Python scripts.
    * data_insert (Notebook) that connects to the database and runs sql files
    * pdf_creator (to be created) creates an invoice from our sql queries



### Data_insert (Notebook)

The package allows you to connect to a local MySQL instance and execute an SQL script. The script reads a specified `.sql` file and runs each SQL command within it against the MySQL database. This is useful for applying database schema changes, running data insertion scripts, or managing database migrations.

Requirements
- `mysql-connector-python` package 

  ```
  pip install mysql-connector-python
  ```

__How It Works__

1. **Database Connection**: The script connects to a MySQL database using the provided credentials.

2. **Script Execution**: It reads the SQL script from the specified file and splits it into individual statements. Each statement is then executed sequentially.

3. **Commit Changes**: After executing all the commands, changes are committed to the database to ensure that any modifications are saved.

4. **Cleanup**: The script closes the cursor and database connection to release resources.

## Notes

- Ensure that your SQL script contains valid SQL commands that can be executed against the MySQL instance.
- The script assumes all commands in the SQL script are separated by a semicolon (`;`).
- Use caution when executing SQL scripts, as improper commands can lead to data loss or corruption.