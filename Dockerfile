
# We don't do "node:latest" b/c if package was updated, could break code.
FROM node:10

# Where our app will live in the container.  Check out Node image for directory
WORKDIR /usr/src/app

# move these files.  So we copy them to working directory with this code.
COPY package*.json ./

# install dependencies.
RUN npm install

# copy everything into container
COPY . .

# expose the port
EXPOSE 3000

# CMD
CMD ["npm", "start"]

# we could build this but it won't work b/c it'd look for MongoDB and it wouldn't find it.
# We use docker-compose so it can easily port to another system 
# instead of creating a seperate mongoDB container manually.
