# Use an official Golang runtime as a parent image
FROM golang:1.21.4

# Set the working directory inside the container
WORKDIR /go/src/app

# Copy the local package files to the container's workspace
COPY . .

# Download and install any required third-party dependencies
RUN go get -d -v ./...

# Install Echo framework
RUN go get -u github.com/labstack/echo/v4

# Build the Go application
RUN go build -o main .

# Expose port 3030 to the outside world
EXPOSE 3030

# Command to run the executable
CMD ["./main"]

