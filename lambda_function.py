import json
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def lambda_handler(event, context):
    logger.info("Received event: %s", json.dumps(event))

    response = {
        "statusCode": 200,
        "body": json.dumps({"message": "Hello from Bedrock Lambda!"})
    }
    
    return response
