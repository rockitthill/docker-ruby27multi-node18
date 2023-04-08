# Dockerfile for rockitthill/rails6

Rails 6 + Ruby 2.7.8 w/ curl, git, nano, node 14, yarn 1.22.4, libmariadb, imagemagick, python2. Compatible with `linux/arm64` (M1, M2) and `linux/amd64` (Intel).

## Building, Tagging, and Pushing

* `docker buildx create --use --name buildx-rails6 --platform linux/arm64,linux/amd64`
* `docker buildx build --push . --platform linux/arm64,linux/amd64 --tag rockitthill/rails6`
