# Building Application

1. Clone application repository from GitHub

   ```sh
   git clone https://github.com/audomsak/quarkus-todo-app.git
   ```

2. Get into the application project directory

   ```sh
   cd quarkus-todo-app/todo
   ```

3. Build the application using Maven (`mvnw` is Maven Wrapper)

   ```sh
   ./mvnw clean package -Dquarkus.package.type=uber-jar
   ```

   You should be able to see build logs similar to this at the end when the build is completed.

   ```sh
   [INFO] [io.quarkus.deployment.QuarkusAugmentor] Quarkus augmentation completed in 8040ms
   [INFO] ------------------------------------------------------------------------
   [INFO] BUILD SUCCESS
   [INFO] ------------------------------------------------------------------------
   [INFO] Total time:  01:10 min
   [INFO] Finished at: 2023-02-27T13:33:16+07:00
   [INFO] ------------------------------------------------------------------------
   ```

4. Check if application artifact(s) were produced

   ```sh
   ls -lrt target
   ```

   _Example output_

   ```sh
   total 79016
   drwxr-xr-x  3 dom  staff        96 Feb 27 13:32 generated-sources
   drwxr-xr-x  3 dom  staff        96 Feb 27 13:32 maven-status
   drwxr-xr-x  8 dom  staff       256 Feb 27 13:32 classes
   drwxr-xr-x  3 dom  staff        96 Feb 27 13:32 generated-test-sources
   drwxr-xr-x  3 dom  staff        96 Feb 27 13:32 quarkus
   drwxr-xr-x  4 dom  staff       128 Feb 27 13:33 surefire-reports
   drwxr-xr-x  4 dom  staff       128 Feb 27 13:33 test-classes
   drwxr-xr-x  3 dom  staff        96 Feb 27 13:33 maven-archiver
   -rw-r--r--  1 dom  staff   1061413 Feb 27 13:33 quarkus-todo-apps-1.0.0.jar.original
   -rw-r--r--  1 dom  staff  39386241 Feb 27 13:33 quarkus-todo-apps-1.0.0-runner.jar
   -rw-r--r--  1 dom  staff       124 Feb 27 13:33 quarkus-artifact.properties
   ```
