#!/bin/bash

EXTERNAL_IP=$(kubectl get service web -n robot-shop -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
# Check if EXTERNAL_IP is set
if [ -z "$EXTERNAL_IP" ]; then
  echo "ERROR: EXTERNAL_IP is not set. Please assign the external IP to the EXTERNAL_IP variable."
  exit 1
fi

# URL to open
URL="http://$EXTERNAL_IP:8080"

# Determine the operating system
OS="$(uname)"
case "$OS" in
  Darwin)
    echo "Detected macOS. Opening the website..."
    open "$URL"
    ;;
  Linux)
    echo "Detected Linux. Opening the website..."
    xdg-open "$URL" || echo "Please ensure 'xdg-open' is installed."
    ;;
  CYGWIN*|MINGW32*|MSYS*|MINGW*)
    echo "Detected Windows. Opening the website..."
    start "$URL"
    ;;
  *)
    echo "Unsupported operating system: $OS"
    echo "Please open the website manually: $URL"
    exit 1
    ;;
esac
