FROM keymetrics/pm2:latest-alpine

# Bundle APP files
RUN mkdir -p /app
WORKDIR /app
COPY . /app

#COPY src src/
#COPY package.json .
#COPY pm2.json .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn

RUN npm install --production
RUN npm install pm2@latest -g
RUN node -v
# Show current folder structure in logs
#RUN ls -al -R
EXPOSE 3000
CMD [ "pm2-runtime", "start", "pm2.json" ]
