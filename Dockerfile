# FROM public.ecr.aws/lambda/nodejs:18 as builder
FROM node:18 as builder
# WORKDIR ${LAMBDA_TASK_ROOT}
WORKDIR /var/task
COPY ./projects/min-max-tic-tac-toe ./min-max-tic-tac-toe
COPY ./projects/tic-tac-toe-handler ./tic-tac-toe-handler
# WORKDIR ./min-max-tic-tac-toe
# RUN npm i
WORKDIR ./tic-tac-toe-handler
RUN npm i
RUN npm run build

# FROM public.ecr.aws/lambda/nodejs:18
FROM node:18
# WORKDIR ${LAMBDA_TASK_ROOT}
WORKDIR /var/task
# COPY --from=builder ${LAMBDA_TASK_ROOT}/min-max-tic-tac-toe/dist/src/* min-max-tic-tac-toe/
# COPY --from=builder ${LAMBDA_TASK_ROOT}/tic-tac-toe-handler/dist/src/* ./
COPY --from=builder /var/task/min-max-tic-tac-toe/dist/src/* min-max-tic-tac-toe/
COPY --from=builder /var/task/tic-tac-toe-handler/dist/src/* ./

# CMD ["index.handler"]

# RUN npm install
# If you are building your code for production, instead include a package-lock.json file on this directory and use:
# RUN npm ci --production
