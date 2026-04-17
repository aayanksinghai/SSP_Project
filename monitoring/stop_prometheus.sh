#!/usr/bin/env bash
# Stop Prometheus + Node Exporter
for svc in prometheus node_exporter; do
    pidfile="monitoring/${svc}.pid"
    if [ -f "$pidfile" ]; then
        pid=$(cat "$pidfile")
        kill "$pid" 2>/dev/null && echo "Stopped ${svc} (PID ${pid})" || echo "${svc} already stopped"
        rm -f "$pidfile"
    fi
done
