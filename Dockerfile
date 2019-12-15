FROM node:12.12.0

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT 9229 9230

WORKDIR /opt/wagbag

COPY . .
RUN npm install
RUN npm install --only=dev
ENV PATH /opt/wagbag/node_modules/.bin:$PATH

RUN nest build

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "node", "dist/main" ]