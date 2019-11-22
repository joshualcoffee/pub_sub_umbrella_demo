# Google PubSub demo
The purpose of this repo is to demo how you can utilize elixir and broadway to consume  messages from Cloud Pub/Sub.  This is an umbrella app to mimic how multiple services will interact.

## Ideas for this demo
* The organization will communicate via a single topic and multiple subscriptions.
* Each service will implement it's own consumer.
* Each service will have it's own subscription.

## Getting started:
You will need a creds.json file from google pubsub.  After that you can play this with demo.

## Starting the app:
* run `mix deps.get`
* run `iex -S mix`

## Mimic workflow
This demo mimics specific workflows.  To have this fully working you will need to do the following:

### Add new site to be consumed by the webhooks app
```elixir
MBA.SyncService.add_site(1)
```

### Utilizing the webhooks app to consume webhooks and emit events
```curl
curl -X POST \
  http://localhost:4001/handle_event \
  -H 'Accept: */*' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Length: 94' \
  -H 'Content-Type: application/json' \
  -H 'Host: localhost:4001' \
  -H 'Postman-Token: b575d309-e13c-4299-a04c-f57ad2c33b45,e850c155-d347-41d4-9c48-ae5f8c2bc6b1' \
  -H 'User-Agent: PostmanRuntime/7.19.0' \
  -H 'cache-control: no-cache' \
  -d '{
	"event": "classRosterBooking.created",
	"siteId": 1,
	"locationId": 222,
	"classId": 1344
}'
```
You can check the console to see how events are being fired.
