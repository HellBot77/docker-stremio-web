FROM alpine AS build

ARG TAG=latest
RUN (([[ "$TAG" = "latest" ]] && DOWNLOAD="latest/download") || DOWNLOAD="download/${TAG}") && \
    wget "https://github.com/Stremio/stremio-web/releases/${DOWNLOAD}/stremio-web.zip" && \
    unzip stremio-web.zip

FROM pierrezemb/gostatic

COPY --from=build /build /srv/http
EXPOSE 8043
