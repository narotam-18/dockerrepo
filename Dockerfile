FROM node:14.6
WORKDIR /app
COPY . /app
#RUN yum update -y &&  yum install npm -y
#RUN yum install curl -y && curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && source ~/.bashrc && nvm install 14.6
RUN echo "NODE_ENV = development" > .env
RUN echo "PORT = 5000" >> .env
RUN echo "MONGO_URI = 'mongodb://35.154.72.3:27017/proshop' " >> .env
RUN echo "JWT_SECRET = 'abc123'" >> .env
RUN npm install
RUN cd frontend && npm install && cd ..
RUN npm run data:import
CMD ["npm","run","dev"]
EXPOSE 3000

