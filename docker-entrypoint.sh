#!/bin/sh

set -e

# Make sure the database exists
touch /app/ooye.db

if [ -f /app/registration.yaml ]; then
  echo "Here is your registration YAML:"
  echo ""
  cat /app/registration.yaml
  echo ""
else
  echo "No registration.yaml mounted on /app/registration.yaml, exiting"
  sleep 60
  exit 1
fi

# echo "Setting up / seeding database if necessary"
#
# emoji_arg=""
# if [ -n "${EMOJI_GUILD}" ]; then
#   emoji_arg="--emoji-guild=${EMOJI_GUILD}"
# fi
#
# node scripts/seed.js $emoji_arg
node scripts/setup.js

echo "Starting server"
exec npm run start
