FROM nginx:1.25.3-alpine

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy the HTML file into the Nginx public directory
COPY index.html /usr/share/nginx/html/index.html

# Copy the banner image into the same public directory
COPY gem.jpg /usr/share/nginx/html/gem.jpg

# Copy in a dynamic Nginx config template
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Cloud Run provides PORT as an env variable
EXPOSE 8080

# Let the entrypoint render the template with $PORT
# Use the Nginx entrypoint script to render the template and then start Nginx
CMD ["nginx-debug", "-g", "daemon off;"]
