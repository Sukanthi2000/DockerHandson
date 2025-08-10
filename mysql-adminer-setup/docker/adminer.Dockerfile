FROM adminer:latest

ENV ADMINER_DESIGN="pepa-linha"
ENV ADMINER_PLUGINS="database,editor"

EXPOSE 8080