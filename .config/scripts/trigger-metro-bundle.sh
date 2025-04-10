#!/bin/bash

echo "⏳ Waiting for Metro to be ready..."
sleep 5

until curl --silent http://localhost:8081/status | grep -q "packager-status:running"; do
  sleep 0.5

  if ! pgrep -f "react-native.*start" >/dev/null; then
    exit 1
  fi
done

echo "🔄 Metro is ready! Triggering bundle..."
curl --silent "http://localhost:8081/index.bundle?platform=ios&dev=true" >/dev/null
echo "✅ Bundle preload complete!"
