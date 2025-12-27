FROM public.ecr.aws/lambda/python:3.13

# Copy function code
COPY lambda_module.py ${LAMBDA_TASK_ROOT}

# Set the Lambda handler
CMD ["lambda_module.handler"]
