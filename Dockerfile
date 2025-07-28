FROM caddy:2-builder-alpine AS builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/cache-handler

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy