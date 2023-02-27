# Application Packaging

1. Packaging application artifact(s) as a container image using docker command where `-t` parameter is a tag for the image and `-f` parameter is the location of `Dockerfile` that defines instructions for building container image.

   ```sh
    docker build -t docker.io/audomsak/quarkus-todo-app:1.0 -f src/main/docker/Dockerfile.uber-jar .
   ```

   _Example Output_

   ```sh
   [+] Building 180.7s (8/8) FINISHED
   => [internal] load build definition from Dockerfile.uber-jar                                                                                                                                                             0.0s
   => => transferring dockerfile: 1.89kB                                                                                                                                                                                    0.0s
   => [internal] load .dockerignore                                                                                                                                                                                         0.0s
   => => transferring context: 2B                                                                                                                                                                                           0.0s
   => [internal] load metadata for registry.access.redhat.com/ubi8/ubi-minimal:8.4                                                                                                                                         12.7s
   => [1/3] FROM registry.access.redhat.com/ubi8/ubi-minimal:8.4@sha256:c536d4c63253318fdfc1db499f8f4bb0881db7fbd6f3d1554b4d54c812f85cc7                                                                                   13.8s
   => => resolve registry.access.redhat.com/ubi8/ubi-minimal:8.4@sha256:c536d4c63253318fdfc1db499f8f4bb0881db7fbd6f3d1554b4d54c812f85cc7                                                                                    0.0s
   => => sha256:d46336f50433ab27336fad8f9b251b2f68a66d376c902dfca23a6851acae502c 39.29MB / 39.29MB                                                                                                                         12.3s
   => => sha256:be961ec6866344c06fe85e53011321da508bc495513bb75a45fc41f6182921b6 1.74kB / 1.74kB                                                                                                                            2.8s
   => => sha256:c536d4c63253318fdfc1db499f8f4bb0881db7fbd6f3d1554b4d54c812f85cc7 1.47kB / 1.47kB                                                                                                                            0.0s
   => => sha256:4d6547bbb7c5fe0f0d37b491c0c1975ff96bf4cf1c26dd665e3a5d70918b5564 737B / 737B                                                                                                                                0.0s
   => => sha256:e7685639f55280ffe8da3724cb1d342091a1ceea79af5eb91a07ce97cd32f221 4.28kB / 4.28kB                                                                                                                            0.0s
   => => extracting sha256:d46336f50433ab27336fad8f9b251b2f68a66d376c902dfca23a6851acae502c                                                                                                                                 1.2s
   => => extracting sha256:be961ec6866344c06fe85e53011321da508bc495513bb75a45fc41f6182921b6                                                                                                                                 0.0s
   => [internal] load build context                                                                                                                                                                                         0.6s
   => => transferring context: 39.40MB                                                                                                                                                                                      0.6s
   => [2/3] RUN microdnf install curl ca-certificates java-11-openjdk-headless     && microdnf update     && microdnf clean all     && mkdir /deployments     && chown 1001 /deployments     && chmod "g+rwX" /deploymen  150.0s
   => [3/3] COPY target/*-runner.jar /deployments/app.jar                                                                                                                                                                   0.1s
   => exporting to image                                                                                                                                                                                                    3.9s
   => => exporting layers                                                                                                                                                                                                   3.9s
   => => writing image sha256:a7be9e6efe406100e2028a81f1c936424247d81c02e0a651f8907915a8f4eb7f                                                                                                                              0.0s
   => => naming to docker.io/audomsak/quarkus-todo-app:1.0
   ```

2. View the container image(s) in local.

   ```sh
   docker images
   ```

   _Example Output_

   ```sh
   REPOSITORY                             TAG       IMAGE ID       CREATED          SIZE
   audomsak/quarkus-todo-app              1.0       a7be9e6efe40   30 minutes ago   559MB
   ```
