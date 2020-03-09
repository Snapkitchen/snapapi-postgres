ARG POSTGRES_VERSION=0.0
FROM postgres:${POSTGRES_VERSION}

ARG POSTGRES_VERSION
ARG POSTGIS_VERSION

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    "postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION}=${POSTGIS_VERSION}.*" \
    "postgresql-${POSTGRES_VERSION}-postgis-${POSTGIS_VERSION}-scripts=${POSTGIS_VERSION}.*" \
    "postgis=${POSTGIS_VERSION}.*" \
    curl \
    unzip \
  && mkdir -p '/var/cache/tz/world' \
  && curl -o '/tmp/tz_world.zip' 'http://efele.net/maps/tz/world/tz_world.zip' \
  && unzip -o '/tmp/tz_world.zip' -d '/var/cache/tz/world' \
  && rm '/tmp/tz_world.zip' \
  && DEBIAN_FRONTEND=noninteractive apt-get -y remove --purge \
    curl \
    unzip \
  && rm -rf '/var/lib/apt/lists/*'
