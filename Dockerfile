# Use an official lightweight Python image.
FROM python:3.9-slim

# Set the working directory in the container.
WORKDIR /app

# Copy the requirements file into the container.
COPY requirements.txt .

# Install dependencies.
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the application code.
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Set environment variables for Flask (optional)
ENV PORT 8080

# Command to run the application using Gunicorn.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
