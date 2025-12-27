def handler(event, context):
    """Basic Lambda handler that returns a Hello World message."""
    result = {
        'content': 'Hello World',
    }
    print(result['content'])
    # TODO: push result to SQS queue
    return {
        "statusCode": 200,
        "body": result['content'],
    }
