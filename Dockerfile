FROM python:3.11-slim-bookworm

# Work dir
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev libjpeg-dev zlib1g-dev && rm -rf /var/lib/apt/lists/*

# Requirements
COPY ./requirements.txt .

# Upgrade pip and install requirements
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && pip install --no-cache-dir -r requirements.txt

# Else code copy
COPY . .

# Run sh
RUN chmod +x /app/start.sh

# Start
CMD ["/app/start.sh"]