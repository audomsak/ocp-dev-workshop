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

10. Wait until the **todo-db** node is surround with blue ring then click on the node. A panel will show up on the right side, click on the **Resources** tab to see Pods and Services.

![Database pod is up and running](images/deploy-09.png)

