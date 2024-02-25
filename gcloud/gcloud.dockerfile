ARG VERSION=465.0.0-alpine as base
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${VERSION} AS base

RUN gcloud components install gke-gcloud-auth-plugin

FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:${VERSION}
COPY --from=base /google-cloud-sdk/bin/gke-gcloud-auth-plugin /google-cloud-sdk/bin/gke-gcloud-auth-plugin