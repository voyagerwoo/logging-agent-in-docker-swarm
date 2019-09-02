FROM fluent/fluentd:v1.6-1

USER root

RUN apk add --no-cache --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install fluent-plugin-elasticsearch \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

RUN apk --no-cache add curl tzdata && cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime

ADD fluent.conf /fluentd/etc/

# USER fluent
