FROM node:lts-stretch

WORKDIR /app
COPY ./ /app

RUN npm install -g @bazel/bazelisk

ENV HOST=0.0.0.0
EXPOSE 9110

# Remove the bazelrc, since containers might run in offline environments
RUN rm -f /app/.bazelrc

# Run bazel once to download bazel and dependencies
RUN bazel build client:devserver

CMD ["bazel", "run", "client:devserver"]

