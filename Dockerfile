FROM postgres:17

# Set environment variables
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Expose the default PostgreSQL port
EXPOSE 5432

# Use the official entrypoint script to initialize the database
CMD ["postgres"]
