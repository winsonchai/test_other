# --- Stage 1: Base & Deps ---
FROM node:20-alpine AS base
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci

# --- Stage 2: Test Execution ---
FROM base AS tester
COPY . .
# If this command exits non-zero, the build halts immediately
RUN npm test

# --- Stage 3: Production Runner ---
FROM node:20-alpine AS runner
WORKDIR /usr/src/app
ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --only=production
COPY --from=tester /usr/src/app/index.js ./index.js

EXPOSE 8080
USER node
CMD ["node", "index.js"]