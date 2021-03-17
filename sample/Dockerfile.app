FROM node:12.18.2 as builder

RUN mkdir -p /app

COPY sample/. /app/

# From builder image output
RUN mkdir /app/node_modules
COPY node_modules /app/node_modules

WORKDIR /app

# Execute the build command
RUN npm run build

# Cleanup the copied source code excluding the build directory
RUN find /app -mindepth 1 ! -regex '^/app/build\(/.*\)?' -delete > /dev/null 2>&1

FROM nginx
COPY ./sample/nginx/nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

# Copy output of the builder process into the nginx directory
COPY --from=builder /app/build /usr/share/nginx/html

RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx && \
    chmod -R 770 /var/cache/nginx /var/run /var/log/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]