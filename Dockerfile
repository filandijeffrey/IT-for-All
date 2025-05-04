# Use a lightweight web server image
FROM nginx:alpine

# Remove default nginx page and copy your site content
COPY ./ /usr/share/nginx/html

# Expose port 80 inside the container
EXPOSE 80

# Nginx starts automatically, so no CMD needed
