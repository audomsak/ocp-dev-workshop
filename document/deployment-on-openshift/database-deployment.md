# Database Deployment Via Web Console

1. Login to OpenShift web console with the given username and password.

   ![Login](images/deploy-00.png)

2. Click on **Skip tour** button.

   ![Skip tour](images/deploy-01.png)

3. Click on **Create a new project** link to create a new project (a.k.a namespace).

   ![Create a new project](images/deploy-02.png)

4. Enter the project name as **user*X*-todo** where _X_ is the number of your username. Then click **Create** button.

   ![Enter project name](images/deploy-03.png)

5. Click **Add+** menu.

   ![Add application](images/deploy-04.png)

6. Select **Database** in the Developer Catalog panel.

   ![Database in the Developer Catalog panel](images/deploy-05.png)

7. Select **PostgreSQL** template.

   ![PostgreSQL template](images/deploy-06.png)

8. Click **Instantiate Template** button.

   ![Instantiate template](images/deploy-07.png)

9. Enter following input:

   - **Database Service Name:** `todo-db`
   - **PostgreSQL Connection Username:** `pguser`
   - **PostgreSQL Connection Password:** `pgpassword`
   - **PostgreSQL Database Name:** `todo`

   Then click **Create** button.

   ![Enter database details](images/deploy-08.png)

10. Wait until the **todo-db** node is surrounded with blue ring then click on the node. A panel will show up on the right side, click on the **Resources** tab to see Pods and Services. Then click on the Pod name.

    ![Resources](images/deploy-09.png)

11. Go to **Terminal** tab.

    ![Open a web terminal](images/deploy-20.png)

12. Enter following command. The password is `pgpassword`

    ```sh
    psql postgresql://todo-db:5432/todo?user=pguser
    ```

    _Example Output_

    ```sh
    psql (10.23)
    Type "help" for help.

    todo=#
    ```

13. Copy these SQL statements and paste to the terminal then press `Enter` on keyboard.

    ```sql
    drop table if exists Todo;
    drop sequence if exists hibernate_sequence;
    create sequence hibernate_sequence start 1 increment 1;
    create table Todo (
        id int8 not null,
        completed boolean not null,
        ordering int4,
        title varchar(255),
        url varchar(255),
        primary key (id)
        );
    alter table if exists Todo
        add constraint unique_title unique (title);
    INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Introduction to Quarkus', true, 0, null);
    INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Hibernate with Panache', false, 1, null);
    INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Visit Quarkus web site', false, 2, 'https://quarkus.io');
    INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Star Quarkus project', false, 3, 'https://github.com/quarkusio/quarkus/');
    ```

    _Example Output_

    ```text
    Type "help" for help.

    postgres=# drop table if exists Todo;
    NOTICE:  table "todo" does not exist, skipping
    DROP TABLE
    postgres=# drop sequence if exists hibernate_sequence;
    NOTICE:  sequence "hibernate_sequence" does not exist, skipping
    DROP SEQUENCE
    postgres=# create sequence hibernate_sequence start 1 increment 1;
    CREATE SEQUENCE
    postgres=# create table Todo (
    postgres(#        id int8 not null,
    postgres(#        completed boolean not null,
    postgres(#        ordering int4,
    postgres(#        title varchar(255),
    postgres(#        url varchar(255),
    postgres(#        primary key (id)
    postgres(#     );
    CREATE TABLE
    postgres=# alter table if exists Todo
    postgres-#     add constraint unique_title unique (title);
    ALTER TABLE
    postgres=# INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Introduction to Quarkus', true, 0, null);
    INSERT 0 1
    postgres=# INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Hibernate with Panache', false, 1, null);
    INSERT 0 1
    postgres=# INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Visit Quarkus web site', false, 2, 'https://quarkus.io');
    INSERT 0 1
    postgres=# INSERT INTO todo(id, title, completed, ordering, url) VALUES (nextval('hibernate_sequence'), 'Star Quarkus project', false, 3, 'https://github.com/quarkusio/quarkus/');
    INSERT 0 1
    ```

14. Run this command to verify if the table gets created.

    ```sh
    \dt
    ```

    *Example Output*

    ```sh
            List of relations
    Schema | Name | Type  |  Owner
    --------+------+-------+----------
    public | todo | table | postgres
    (1 row)
    ```
