FROM node:18-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json ./
# Install only production dependencies (Keeps image small)
RUN npm ci --omit=dev

# ---------- Stage 2: Runtime (Production) ----------
FROM node:18-alpine
WORKDIR /app

# 1. Copy dependencies from the builder stage
COPY --from=deps /app/node_modules ./node_modules

# 2. Copy your actual code
COPY . .

# 3. SECURITY: Create a non-root user
# (This simple command can be the difference between Hire/No-Hire)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# 4. FIX: Use Port 5000 to match docker-compose
EXPOSE 5000

CMD ["node", "server.js"]