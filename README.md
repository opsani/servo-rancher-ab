# Optune Servo with Rancher (adjust) and Apache Benchmark (measure) drivers

## Get a copy of the servo-rancher adjust driver configuration file:
```
curl -sLO https://raw.githubusercontent.com/kumulustech/servo-rancher/master/app.yml
```
Edit the file to define the scale of test parameters. See the servo-rancher repository README for instructions on configuring the servo deployment app.yml document.

## Build servo container
```
docker login <custom registry
docker build . -t user-or-project-name/servo-rancher-ab
docker push user-or-project-name/servo-rancher-ab
```

## Create a Rancher Stack/Service to run the Optune servo
Use the example docker_compose.yml and rancher_compose.yml.  Edit the docker_compose.yml
file to include the image created and registered above: e.g. user-or-project-name/servo-rancher-ab

*NOTE*: Rancher must be configured to use the same registry as the pushed container
