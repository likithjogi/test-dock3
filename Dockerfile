FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN apt-get update && \
	apt-get install sudo curl -y && \
	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
	sudo apt-get install -y nodejs

# Copy app source code
COPY . .

#Expose port and start application
EXPOSE 8080
CMD [ "npm", "start" ]