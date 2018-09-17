# Optune Servo with Rancher (adjust) and Apache Benchmark (measure) drivers

## Get a copy of the servo-rancher adjust driver configuration file:
```
curl -sLo rancher/config.yaml https://raw.githubusercontent.com/kumulustech/servo-rancher/master/sample_config.yaml
```
Edit the file to define the scale of test parameters. See the servo-rancher repository README for instructions on configuring the servo deployment app.yml document.

## Build servo container
```
docker login #custom_registry_name
docker build . -t user-or-project-name/servo-rancher-ab:latest
docker push user-or-project-name/servo-rancher-ab:latest
```

## Create a Rancher Stack/Service to run the Optune servo
Use the example docker_compose.yml and rancher_compose.yml.  Edit the docker_compose.yml
file to include the image created and registered above: e.g. user-or-project-name/servo-rancher-ab

*NOTE*: Rancher must be configured to use the same registry as the pushed container
