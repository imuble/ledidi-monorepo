FROM ghcr.io/apollographql/router:v1.32.0

# Copy pre-generated schema and config
COPY supergraph.graphql /dist/schema/supergraph.graphql
COPY router.yaml /dist/config/router.yaml

HEALTHCHECK --interval=5s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/health || exit 1

CMD ["--config", "/dist/config/router.yaml", "--supergraph", "/dist/schema/supergraph.graphql"]