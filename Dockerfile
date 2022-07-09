FROM node:14.17-alpine as build
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

#install dep
COPY package.json ./
COPY yarn.lock ./
RUN yarn install

#add app
COPY . ./

#build the app
RUN yarn build

# #serve the app
# FROM nginx:1.21.1-alpine
# COPY --from=build /app/build /usr/share/nginx/html

# # react router dom
# COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80

CMD ["npm", "start"]