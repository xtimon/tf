# Build Kubernetes TF provider fork
FROM golang:1.10 as builder
RUN go get github.com/sl1pm4t/terraform-provider-kubernetes &&\
    go install -v github.com/sl1pm4t/terraform-provider-kubernetes

# Build image with Kubernetes provider
FROM hashicorp/terraform:full
COPY --from=builder /go/bin/terraform-provider-kubernetes ~/.terraform.d/plugins/
