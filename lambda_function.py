import json
import boto3

def lambda_handler(event, context):
    client = boto3.client("bedrock-runtime", region_name="eu-west-3")

    model_id = "anthropic.claude-v2"  # Remplace par le modèle que tu veux utiliser

    prompt = event.get("prompt", "Bonjour, comment puis-je vous aider ?")

    try:
        response = client.invoke_model(
            modelId=model_id,
            contentType="application/json",
            accept="application/json",
            body=json.dumps({"prompt": prompt, "max_tokens": 200})
        )

        response_body = json.loads(response["body"].read().decode("utf-8"))
        return {
            "statusCode": 200,
            "body": json.dumps(response_body)
        }

    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
