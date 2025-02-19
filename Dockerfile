# Use Python 3.12 as the base image
FROM python:3.12

# Set the working directory in the container
WORKDIR /data

# Install distutils and other dependencies
RUN apt-get update && apt-get install -y python3-distutils && rm -rf /var/lib/apt/lists/*

# Upgrade pip and setuptools
RUN pip install --upgrade pip setuptools

# Install Django version 3.2
RUN pip install django==3.2

# Copy the current directory contents into the container at /data
COPY . .

# Run Django migrations
RUN python manage.py migrate

# Expose port 8000 for the Django application
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

