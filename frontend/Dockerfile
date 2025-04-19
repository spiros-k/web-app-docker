
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
