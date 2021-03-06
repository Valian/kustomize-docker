FROM alpine:3.8
ENV KUSTOMIZE_VER 1.0.5
ENV KUBECTL_VER 1.11.1

RUN apk --no-cache add curl gettext

RUN mkdir /working
WORKDIR /working

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64  -o /usr/bin/kustomize \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kustomize /usr/bin/kubectl \
    && apk --no-cache add git

CMD ["/usr/bin/kustomize"]
