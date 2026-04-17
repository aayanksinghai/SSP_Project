#!/usr/bin/env bash
# Start Prometheus + Node Exporter for SSP study
set -euo pipefail
INSTALL_DIR="/home/aayanksinghai/SSP/Yash_SSP/SSP_Project_Microservices_Granularity/ssp_monitoring"
CONFIG_DIR="/home/aayanksinghai/SSP/Yash_SSP/SSP_Project_Microservices_Granularity/monitoring"

echo "[START] Node Exporter..."
"${INSTALL_DIR}/node_exporter/node_exporter" \
    --web.listen-address=:9100 \
    > "${CONFIG_DIR}/node_exporter.log" 2>&1 &
echo $! > "${CONFIG_DIR}/node_exporter.pid"
echo "  Node Exporter PID=$(cat ${CONFIG_DIR}/node_exporter.pid) → :9100"

echo "[START] Prometheus..."
"${INSTALL_DIR}/prometheus/prometheus" \
    --config.file="${CONFIG_DIR}/prometheus.yml" \
    --storage.tsdb.path="/home/aayanksinghai/SSP/Yash_SSP/SSP_Project_Microservices_Granularity/ssp_monitoring/prometheus_data" \
    --storage.tsdb.retention.time=7d \
    --web.listen-address=:9090 \
    --log.level=warn \
    > "${CONFIG_DIR}/prometheus.log" 2>&1 &
echo $! > "${CONFIG_DIR}/prometheus.pid"
echo "  Prometheus PID=$(cat ${CONFIG_DIR}/prometheus.pid) → :9090"
echo ""
echo "Prometheus UI: http://localhost:9090"
echo "Node Exporter: http://localhost:9100/metrics"
