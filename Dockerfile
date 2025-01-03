# Use the official Python image from the Docker Hub
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy the pyproject.toml and poetry.lock files
COPY pyproject.toml poetry.lock /app/

# Install Poetry
RUN pip install poetry

# Install dependencies
RUN poetry install --no-dev

# Copy the rest of the application code
COPY . /app/

# Expose the Flask app port
EXPOSE 5000

# Set the command to run the app
CMD  ["poetry", "run", "python", "workflow_for_git_huzaifa/workflow_for_git_huzaifa/app.py", "-h", "0.0.0.0", "-p", "5000"]
