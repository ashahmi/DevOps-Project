# Use a basic nginx image
FROM nginx:latest

# Copy index.html and the 5 pictures to the nginx html directory
COPY . /usr/share/nginx/html/


# Expose port 80
EXPOSE 80
