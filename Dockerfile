# FROM debian:12

# WORKDIR /frontend-app

# RUN apt-get update && apt-get -y install curl git

# RUN git clone https://github.com/docker-hy/material-applications.git /frontend-app

# #RUN apt-get remove --yes nodejs

# RUN curl -sL https://deb.nodesource.com/setup_16.x | bash && apt install -y nodejs

# RUN node -v && npm -v

# WORKDIR /frontend-app/example-frontend

# #RUN npm update
# RUN npm install react-scripts
# RUN npm run build
# RUN npm install -g serve

# #RECREATE IMAGE AGAIN TO TEST http://localhost:5000/api

# ARG REACT_APP_BACKEND_URL
# ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

# EXPOSE 5000

# CMD ["serve", "-s", "build", "-l", "5000"]




FROM debian:12

WORKDIR /frontend

RUN apt-get update && apt-get -y install curl git && apt -y install nginx

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash && apt install -y nodejs

RUN git clone https://github.com/docker-hy/material-applications.git /frontend

WORKDIR /frontend/example-frontend

RUN npm install
RUN npm run build

ARG REACT_APP_BACKEND_URL
ENV REACT_APP_BACKEND_URL=$REACT_APP_BACKEND_URL

RUN rm -rf /var/www/html/* && cp -r ./build/* /var/www/html/
COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]