FROM python:slim-bookworm

# Work dir
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Requirements
COPY ./requirements.txt .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Else code copy
COPY . .

# Run sh
RUN chmod +x /app/start.sh

# Start
CMD ["/app/start.sh"]