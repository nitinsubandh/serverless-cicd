import json

def handler(event, context):
    name = event.get('name')
    return {
        'statusCode': 200,
        'body': json.dumps(f'Hello {name} from Lambda!')
    }

