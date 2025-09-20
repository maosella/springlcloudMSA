# Spring Cloud MSA Helm chart

This chart packages the services that compose the Spring Cloud microservices architecture used in the CTD final project. It creates Deployments/StatefulSets and Services for:

- Eureka discovery server
- Centralized Spring Cloud Config server
- API Gateway
- Catalog, Movie and Series microservices
- Supporting infrastructure: MySQL, MongoDB (+ Mongo Express), RabbitMQ and Zipkin

## Prerequisites

- Kubernetes 1.21+
- Persistent volume provisioner in the cluster (for MySQL and MongoDB)
- Container images for the microservices available in a registry reachable from the cluster (the default image names match those produced by the existing Dockerfiles)

## Installing the chart

```bash
helm upgrade --install springcloud-msa ./helm/springcloud-msa \
  --namespace springcloud-msa --create-namespace
```

Override values as needed, e.g. to point to a custom container registry or to change resource requests:

```bash
helm upgrade --install springcloud-msa ./helm/springcloud-msa \
  --namespace springcloud-msa --create-namespace \
  --set movieService.image.repository=my-registry/movie-service \
  --set mysql.persistence.storageClassName=gp3
```

## Configuration highlights

- `configServer.env.gitUri` and `gitSearchPaths` control the Git repository consumed by the config service.
- `mysql.*` and `mongodb.*` sections define credentials and persistence options for the backing databases used by the microservices.
- Each microservice exposes `javaOpts`, `resources`, and Kubernetes scheduling knobs (`nodeSelector`, `tolerations`, `affinity`).
- The API Gateway service type defaults to `LoadBalancer` to expose the entry point outside the cluster; change it to `ClusterIP` if an ingress controller is preferred.

Refer to `values.yaml` for the complete list of tunable parameters.
