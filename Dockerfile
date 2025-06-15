FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y nginx
RUN echo "<h1>Sample Web App Deployed via Jenkins</h1>" > /var/www/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

