FROM python:3.9

# Work dir
WORKDIR /app

# Requirements
COPY ./requirements.txt .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt && mkdir -p /app/logs

# Else code copy
COPY . .

# Run sh
RUN chmod +x /app/start.sh

# Start
CMD ["/app/start.sh"]