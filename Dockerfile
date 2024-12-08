# Step 1: Use an official Python runtime as a parent image
FROM python:3.12-slim

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Step 4: Install system dependencies
RUN apt-get update && apt-get install -y     build-essential     libssl-dev     libffi-dev     python3-dev     && apt-get clean

# Step 5: Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir -U pip     && pip install --no-cache-dir -r requirements.txt

# Step 6: Copy the rest of the application code into the container
COPY . /app

# Step 7: Ensure the start.sh script is executable
RUN chmod +x start.sh

# Step 8: Command to run the application
CMD ["bash", "start.sh"]
