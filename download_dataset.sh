#!/bin/bash

# https://doi.org/10.5281/zenodo.11235637
URL="https://zenodo.org/records/11235637/files/corrosion-in-industrial-complexes-in-ostrava.zip?download=1"

# Extract the filename from the URL
FILENAME=$(basename "${URL%%\?*}")

# Download the ZIP file
echo "Downloading ${FILENAME}..."
curl -L -o "$FILENAME" "$URL"

# Check if the download was successful
if [[ -f "$FILENAME" ]]; then
  echo "Download complete."

  # Unzip the file
  echo "Unzipping ${FILENAME}..."
  unzip "$FILENAME"

  # Remove the ZIP file
  echo "Cleaning up..."
  rm "$FILENAME"

  echo "Done."
else
  echo "Failed to download the file."
fi
