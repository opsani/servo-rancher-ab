# Optune Servo with Rancher (adjust) and Apache Benchmark (measure) drivers

## Build servo container
If the build uses a config file for the rancher resources, edit the example file: rancher/sample_config.yaml, and rename it to rancher/config.yaml.  However, it may be more straight forward to edit the docker_compose.yml document to simply pass the parameters as environment variables within the Rancher service.

```
# Login to docker registry
docker login
# or Login to a private registry
docker login registry.example.com

docker build . -t examplecom/servo-rancher-ab:latest
docker push examplecom/servo-rancher-ab:latest
```

Note: Builds can also point to github repositories for servo-rancher, and servo-ab drivers by passing the ORG environment variable, for example:
```
docker build --build-arg ORG=examplecom . -t examplecom/servo-rancher-ab:latest
```

## Create a Rancher Stack/Service to run the Optune servo
1) Ensure that the "Secrets" service is enabled in Rancher

2) Add a secret for the Optune SaaS service token called optune_auth_token

3) Create an API Key and API Secret for the Rancher enviornment, and then create a secret for both parameters called optune_api_key and optune_api_secret

*NOTE* All three secrets must be lowercase, in order to be matched by the system.

4) Create a Stack in Rancher for the Optune Servo, load the example docker_compose.yml and rancher_compose.yml files from the compose directory.  *Don't submit the stack yet*

5) Edit the docker_compose.yml data to point to the docker image built in the initial steps. Now submit the stack.

6) In the Stack container view, review the logs from the Servo container to ensure that communication is working with the upstream Optune SaaS service.



*NOTE*: Rancher must be configured to use the same registry as the pushed container, if Docker Hub is the registry, on additional configuration is necessary.
