FROM swift:4
WORKDIR /app
ADD . ./
COPY ./Package.swift ./
RUN swift package clean
RUN swift build -c release
RUN mkdir /app/bin
RUN mv `swift build -c release --show-bin-path` /app/bin
ENTRYPOINT ./bin/release/Run serve -e prod -b 0.0.0.0