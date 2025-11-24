#!/bin/bash
set -e

# Script to generate DocC documentation content and serve it locally
# for the purposes ot testing it. Generates a combined documentation archive
# from the ExampleDocs and SampleLibrary targets.

# Define output directory
OUTPUT_DIR="docs-build"

# Clean previous build
rm -rf "$OUTPUT_DIR"

# Generate documentation
echo "Generating documentation..."
swift package --disable-sandbox generate-documentation \
  --enable-experimental-combined-documentation \
  --enable-mentioned-in \
  --enable-experimental-external-link-support \
  --target ExampleDocs \
  --target SampleLibrary \
  --output-path "$OUTPUT_DIR" \
  --transform-for-static-hosting \
  --hosting-base-path /

# Serve the documentation
echo "Starting web server..."
# -p 4000: Port 4000
# -a localhost: Bind to localhost
# -c-1: Disable caching
# --silent: Suppress log output (optional, but keeps Playwright logs cleaner)
npx http-server "$OUTPUT_DIR" -p 4000 -a localhost -c-1
