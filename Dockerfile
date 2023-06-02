FROM gcc as build
COPY main.c /
RUN ["gcc", "-Oz", "-s", "-static", "-o", "fork-bomb", "main.c"]


FROM alpine as compress
RUN ["apk", "add", "upx"]
COPY --from=build /fork-bomb /
RUN ["upx", "/fork-bomb"]


FROM scratch
COPY --from=compress /fork-bomb /
CMD ["/fork-bomb"]
