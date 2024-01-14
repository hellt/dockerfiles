FROM python:3.10-alpine as builder

ARG VERSION=6.4.0
ARG OCTAVIA_VERSION=3.6.0

RUN apk add gcc python3-dev libc-dev linux-headers && \
    pip install wheel \
    python-openstackclient==${VERSION} \
    python-octaviaclient==${OCTAVIA_VERSION}


RUN pip freeze > requirements.txt && pip wheel -r requirements.txt -w /wheels

# Final image
FROM python:3.10-alpine

COPY --from=builder /wheels /wheels

RUN pip install --no-index --find-links=/wheels python-openstackclient python-octaviaclient

CMD ["openstack"]