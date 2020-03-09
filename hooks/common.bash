: "${DOCKER_REPO:=snapkitchen/snapapi-postgres}"

get_versions() {
  cat version-matrix
}

get_postgres_version() {
  echo "${1:-}" | cut -d "-" -f 1
}

get_postgis_version() {
  echo "${1:-}" | cut -d "-" -f 2
}
