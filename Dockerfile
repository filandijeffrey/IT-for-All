# Use a lightweight web server
FROM nginx:alpine

# Copy your website files into the default Nginx web directory
COPY . /usr/share/nginx/html