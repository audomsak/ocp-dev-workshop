# Build And Deploy Application Using S2I (Source To Image)

1. Click **Add+** menu.

   ![Add application](images/deploy-10.png)

2. Select **Import from Git** in the Git Repository panel.

   ![Import from Git](images/deploy-11.png)

3. Enter **Git Repo URL** as `https://github.com/audomsak/quarkus-todo-app` then click **Show advanced Git options** link.

   ![Import from Git](images/deploy-12.png)

4. Enter `/todo` to the **Context dir** (this is because our application project is in the `todo` directory)

   ![Import from Git](images/deploy-13.png)

5. Scroll down and delete the **Application name** value. Then click **Create** button.

   ![Import from Git](images/deploy-14.png)

6. Click on the **quarkus-todo-app** node, then go to the **Resources** tab in the panel on the right and then click on **View logs** link to see build logs.

   ![View build logs](images/deploy-15.png)

7. You should be able to see application and container image builds logs.

   ![Build logs](images/deploy-16.png)

8. Wait until the build changes to `Completed`. Then select **Topology** menu to go back to the topology view.

   ![Build logs](images/deploy-17.png)

9. You should be able to see the **quarkus-todo-app** node is surrounded by blue ring (it means the Pod is up and running). Click on the arrow icon to open the application URL.

   ![Open application URL](images/deploy-18.png)

10. Application homepage shoud show up without any todo tasks. This is because the application is currently not able to connect to PostgreSQL database.

    ![Application homepage](images/deploy-19.png)
