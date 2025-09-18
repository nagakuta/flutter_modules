# Base image
FROM dart:3.8-sdk

# Maintainer
LABEL maintainer="nagakuta <nagakuta0314+github@gmail.com>"

# Workdir
WORKDIR /workspace

# Install Dart dependencies
COPY pubspec.* ./
RUN dart pub get --verbose

# Activate Dart dependencies
RUN dart pub get --offline --verbose
RUN dart pub global activate fvm \<4.0.0 --verbose
