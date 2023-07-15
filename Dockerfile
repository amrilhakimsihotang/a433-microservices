#menggunakan Node.js 18 image
FROM node:18-alpine as base

#Set direktori di dalam kontainer
WORKDIR /app

#Copy file package.json dan package-lock.json
COPY package*.json ./

#mendownload dan menginstall shell scrip wait
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

#Install dependencies
RUN npm i

#Copy source code ke directory
COPY . . 

#Set variabel environment
ENV PORT=3000

#Expose spesifikasi port dari env
EXPOSE $PORT

# Start Node.js
CMD [ "node", "index.js" ]
