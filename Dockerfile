FROM postgres:14.4

ENV POSTGRES_DB 'dance'
ENV POSTGRES_USER 'postgres'
ENV POSTGRES_PASSWORD 'postgres'

RUN echo "Ok!"