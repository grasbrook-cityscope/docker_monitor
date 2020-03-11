import requests
import argparse

def send(url, data):
    # wrap neatly in json
    json_payload ="{ \'text\': \'" + data + "\'' }"

    print(json_payload)
    # send to mattermost
    # response = requests.post(url, json_payload)
    
    # if not response.status_code == 200:
    #     print("could not post to", url)
    #     print("Error code", response.status_code)
    # else:
    #     print("Successfully posted to ", url, response.status_code)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Send a message to given webhook (e.g. mattermost)')
    parser.add_argument('webhook', type=str, help="webhook url to send a perlisism to")
    parser.add_argument('--data', type=str, default="", help="send some payload")
    args = parser.parse_args()

    webhook_url = args.webhook

    message = "CityIO is down again :roll_eyes: \n" + args.data

    send(webhook_url, message)