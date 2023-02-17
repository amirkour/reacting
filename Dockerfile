FROM public.ecr.aws/lambda/nodejs:18 as builder
WORKDIR ${LAMBDA_TASK_ROOT}

COPY ./projects/min-max-tic-tac-toe/ ./min-max-tic-tac-toe
COPY ./projects/tic-tac-toe-handler/ ./tic-tac-toe-handler

WORKDIR ./tic-tac-toe-handler
RUN npm i
RUN npm run build

# TODO
# If you are building your code for production, instead include a package-lock.json file on this directory and use:
# RUN npm ci --production

FROM public.ecr.aws/lambda/nodejs:18
WORKDIR ${LAMBDA_TASK_ROOT}

COPY --from=builder ${LAMBDA_TASK_ROOT}/min-max-tic-tac-toe/dist/ min-max-tic-tac-toe/
COPY --from=builder ${LAMBDA_TASK_ROOT}/tic-tac-toe-handler/dist/ tic-tac-toe-handler/

CMD ["./tic-tac-toe-handler/index.handler"]
