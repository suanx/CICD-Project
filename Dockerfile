FROM nginx:latest                           # Use the latest Nginx image from Docker Hub
COPY index.html /usr/share/nginx/html/index.html  # Copy index.html to Nginx's default web directory
EXPOSE 80                                   # Expose port for HTTP traffic
CMD ["nginx", "-g", "daemon off;"]          # Start Nginx in the foreground to keep the container running
