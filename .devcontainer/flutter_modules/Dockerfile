# Base image
FROM dart:3.0-sdk

# Maintainer
LABEL maintainer="nagakuta <nagakuta0314+github@gmail.com>"

# Workdir
WORKDIR /workspace/flutter_modules

# Install FVM
ARG PATH=/root/.pub-cache/bin:$PATH
RUN dart pub global activate fvm --verbose && \
    dart pub global activate melos --verbose && \
    dart pub global activate mason_cli --verbose

# Set paths
ENV PUB_ROOT=/root/.pub-cache
ENV PATH $PUB_ROOT/bin:$PATH
