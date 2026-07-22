# 1. FROM: The base operating system/language environment
# CHANGE THIS if the app is Python (FROM python:alpine) or Go (FROM golang:alpine)
FROM node:alpine

# 2. RUN: Installing system dependencies
# CHANGE THIS if the exam asks you to install curl, openssh, or other Linux tools
RUN apk add --no-cache tini git 

# 3. WORKDIR: Where the files live inside the container
# This can be anything (e.g., /app or /usr/src/app). 
WORKDIR /usr/src/app

# 4. COPY: Copying your code from your laptop into the container
# Standard practice is to copy package.json first, install, then copy the rest of the code
COPY package*.json ./
RUN npm install
COPY . .

# 5. USER: Security Best Practice! Run as non-root user
# Node alpine images have a built-in user named "node". Git uses "git".
USER node

# 6. EXPOSE: Tells Docker which port the container listens on
# CHANGE THIS to match the port your app code actually runs on (e.g., 3000, 5000, 8080)
EXPOSE 3000

# 7. CMD / ENTRYPOINT: What the container executes when it starts
# CHANGE THIS to run your app's startup command (e.g., ["npm", "start"] or ["python", "app.py"])
CMD ["node", "app.js"]