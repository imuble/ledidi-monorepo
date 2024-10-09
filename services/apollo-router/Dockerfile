FROM ghcr.io/apollographql/router:v1.32.0

COPY services/apollo-router/supergraph.graphql /dist/schema/supergraph.graphql
COPY services/apollo-router/router.yaml /dist/config/router.yaml

HEALTHCHECK --interval=5s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

CMD ["--config", "/dist/config/router.yaml", "--supergraph", "/dist/schema/supergraph.graphql"]