# Configure Application With ConfigMap

## Create ConfigMap

1. Select **ConfigMaps** menu.

   ![Create ConfigMap](images/deploy-22.png)

2. Click on **Create ConfigMap** button.

   ![Create ConfigMap](images/deploy-23.png)

3. Enter following inputs:

   - **Name:** `quarkus-todo-config`
   - **Key:** `quarkus.datasource.username`
   - **Value:** `pguser`

    Then click **Add key/value** link

   ![Create ConfigMap](images/deploy-24.png)

4. Enter following inputs:

   - **Key:** `quarkus.datasource.password`
   - **Value:** `pgpassword`

    Then click **Create** button.

   ![Create ConfigMap](images/deploy-25.png)

5. The new ConfigMap should be created.

   ![Create ConfigMap](images/deploy-26.png)

## Configure Application

1. Go to **Topology** menu.

   ![Set application configs](images/deploy-27.png)

2. Select the **quarkus-todo-app** node, then click **quarkus-todo-app** Deployment link.

   ![Set application configs](images/deploy-28.png)

3. Go to **Environment** tab, Select the **quarkus-todo-config** ConfigMap we've just created earlier. Then click **Save** button.

   ![Set application configs](images/deploy-29.png)

4. Go to **Topology** menu and click on arrow icon to open application URL.

   ![Set application configs](images/deploy-30.png)

5. This time you should be able to see a list of todo tasks. The application can now connect to database successfully.

   ![Set application configs](images/deploy-31.png)
