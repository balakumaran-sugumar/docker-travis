FROM node:alpine

# this is for the build phase
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# this is for the run phase
FROM nginx
EXPOSE 80
# copy the /app/build contianing the actual code to the ngnix html folder
COPY --from=0 /app/build /usr/share/nginx/html
# no need to explicitly start the ngnix, it will start automatically

