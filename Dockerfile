FROM node:24-alpine

RUN apk add --no-cache git
RUN git clone --depth 1 --branch v3.3 https://gitdab.com/cadence/out-of-your-element.git /app
WORKDIR /app
RUN npm i

RUN adduser ooye -Du 1001
RUN chown -R ooye /app
RUN mkdir /app/db
RUN touch /app/db/ooye.db
USER ooye

# Discord Guild ID to upload emojis to, if necessary.
ENV EMOJI_GUILD=""

VOLUME /app/db
EXPOSE 6693/tcp

COPY --chmod=744 --chown=ooye:ooye ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

