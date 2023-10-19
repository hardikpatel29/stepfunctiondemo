import json

def lambda_handler(event, context):
    # Your code here
    message = "Hello from your Lambda function!"
    
    response = {
        "statusCode": 200,
        "body": json.dumps(message)
    }
    
    return response
