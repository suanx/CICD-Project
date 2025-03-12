FROM nginx:latest  

# Copy the custom index.html file  
COPY index.html /usr/share/nginx/html/index.html  

# Expose port 80 for web access  
EXPOSE 80  

# Start Nginx in the foreground  
CMD ["nginx", "-g", "daemon off;"]
