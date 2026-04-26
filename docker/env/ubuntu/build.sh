docker build -t jheo4/env:24.04 --build-arg FROM_IMAGE=ubuntu:24.04 ./24.04/env
docker build -t jheo4/env:24.04_dev --build-arg FROM_IMAGE=ubuntu:24.04 ./24.04/dev

docker build -t jheo4/env:26.04 --build-arg FROM_IMAGE=ubuntu:26.04 ./26.04/env
docker build -t jheo4/env:26.04_dev --build-arg FROM_IMAGE=ubuntu:26.04 ./26.04/dev

# docker push jheo4/env:24.04
# docker push jheo4/env:24.04_dev
# docker push jheo4/env:26.04
# docker push jheo4/env:26.04_dev
