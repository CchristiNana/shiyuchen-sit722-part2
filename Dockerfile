# Use an official Python runtime as a parent image
FROM --platform=linux/amd64 python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file from the 'book_catalog' directory
COPY book_catalog/requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire 'book_catalog' directory into the container
COPY book_catalog /app/

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define the command to run your application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
