FROM ruby:2.7-alpine

ENV LANG=C.UTF-8
RUN apk add --no-cache build-base git less libxml2-dev libxslt-dev postgresql-dev tzdata
