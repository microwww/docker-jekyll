FROM jekyll/jekyll

#RUN git https://gitee.com/changshu/blog.git
RUN gem install jekyll-seo-tag

VOLUME /git/
VOLUME /www/

ARG TEMPLATE=/git/template
ARG POSTS=/git/posts

RUN echo "#!/bin/bash" >> /docker_entrypoint.sh \
    && echo "set -e" >> /docker_entrypoint.sh \
    && echo "cd /git/ && git pull" >> /docker_entrypoint.sh \
    && echo "chown -R jekyll /www/" >> /docker_entrypoint.sh \
    && echo "rm -rf ${TEMPLATE}/_posts" >> /docker_entrypoint.sh \
    && echo "cp -r ${POSTS} ${TEMPLATE}/_posts" >> /docker_entrypoint.sh \
    && echo "cd ${TEMPLATE}" >> /docker_entrypoint.sh \
    && echo "jekyll build -d /www/ --incremental" >> /docker_entrypoint.sh \
    && echo "git checkout ." >> /docker_entrypoint.sh

RUN chmod +x /docker_entrypoint.sh

CMD ["/docker_entrypoint.sh"]
