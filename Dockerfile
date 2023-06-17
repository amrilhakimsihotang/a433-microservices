#1. Image untuk membuat container
#Container yang dibuat running pada
#Alpine Linux dengan node:14

FROM node:14 

#2. direktori kerja untuk container
WORKDIR /app

#3. Perintah untuk menyalin semua file & folder dari sumber direktori(local)
#ke direktori kerja container (/app) 
COPY . .

#4. Mengatur variabel dalam linkungan container(NODE_ENV & DB_HOST)
#dan dapat diakses oleh aplikasi yang running  di dalam container
ENV NODE_ENV=production DB_HOST=item-db

#5. Perintah ini menjalankan perintah npm di dalam container
#seperti menginstall dependensi project (--production) ,
#memberikan izin penuh saat menjalankan skrip (--unsafe-perm)
#dan kemudian menjalankan skrip build project
RUN npm install --production --unsafe-perm && npm run build

#6. Expose port yang digunakan pada container.
EXPOSE 8080

#7. perintah untuk menjalankan aplikasi saat container running
CMD ["npm", "start"]



