#!/bin/bash

# Check if the 'worldcup' database exists
if ! psql -U freecodecamp -lqt | cut -d \| -f 1 | grep -qw worldcup; then
  echo "Creating worldcup database..."
  createdb -U freecodecamp worldcup
  echo "Restoring database from worldcup.sql..."
  psql -U freecodecamp -d worldcup -f worldcup.sql
else
  echo "worldcup database already exists."
fi
