# Grafana Setup (Optional)

## Install
```bash
sudo apt-get install -y apt-transport-https software-properties-common
wget -qO - https://apt.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://apt.grafana.com stable main" | sudo tee /etc/apt/sources.list.d/grafana.list
sudo apt-get update && sudo apt-get install grafana
sudo systemctl enable --now grafana-server
```

## Access
http://localhost:3000  (admin / admin)

## Data Source
Add → Prometheus → URL: http://localhost:9090

## Recommended Dashboards (import by ID)
- **Node Exporter Full**: 1860
- **Go Runtime Metrics**: 13240
- **HTTP Overview**:       9614

## Snapshot Export
In Grafana: Dashboard → Share → Snapshot → Save to server
Or use the API:
```bash
curl -s http://admin:admin@localhost:3000/api/snapshots \
  -H 'Content-Type: application/json' \
  -d @<dashboard_json>
```
