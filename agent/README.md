mkdir openclaw_data

docker compose up
docker exec -it openclaw openclaw onboard
http://ollama:11434

sudo vim openclaw_data/openclaw.json

```yaml
```
  "mode": "local",
  "port": 18789,
  "bind": "0.0.0.0",
  "plugins": {
    "entries": {
      "ollama": {
        "enabled": true
      },
      "bonjour": {
        "enabled": false
      }
    }
  }
```
```


