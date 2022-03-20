FROM keymetrics/pm2:latest-alpine

# Bundle APP files
RUN mkdir -p /data/tms_frontend
WORKDIR /data/tms_frontend
COPY index.js /data/tms_frontend/

#COPY src src/
#COPY package.json .
#COPY pm2.json .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

# Show current folder structure in logs
#RUN ls -al -R
EXPOSE 3000
CMD [ "pm2-docker", "start", "pm2.json" ]
