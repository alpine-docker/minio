# ---- Build Stage ----
FROM golang:1.24-alpine AS builder

ARG RELEASE=latest

RUN apk add --no-cache git bash

WORKDIR /src

# Detect architecture and set GOARCH
RUN ARCH=$(case `uname -m` in \
        x86_64) echo amd64 ;; \
        armv7l) echo arm ;; \
        aarch64) echo arm64 ;; \
        ppc64le) echo ppc64le ;; \
        s390x) echo s390x ;; \
        *) echo "unsupported arch"; exit 1 ;; \
    esac) && \
    echo "Building for ARCH=$ARCH" && \
    export GOOS=linux && \
    export GOARCH=$ARCH && \
    # Build MinIO using official go install
    if [ "$RELEASE" = "latest" ]; then \
      go install github.com/minio/minio@latest ; \
    else \
      go install github.com/minio/minio@${RELEASE} ; \
    fi

# ---- Runtime Stage ----
FROM alpine:3.20

RUN apk add --no-cache ca-certificates && \
    addgroup -S minio && adduser -S minio -G minio

# Copy the binary from builder
COPY --from=builder /go/bin/minio /usr/local/bin/minio

USER minio
WORKDIR /home/minio

EXPOSE 9000 9001
VOLUME ["/data"]

ENTRYPOINT ["minio"]
CMD ["server", "/data", "--console-address", ":9001"]
