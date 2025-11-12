#!/bin/bash

CP=$(find lib -name "*.jar" | paste -sd ":" -)

java \
  -jar lib/junit-platform-console-standalone-*.jar \
  --class-path "$CP:./out/classes" \
  --scan-class-path \
  --include-engine junit-jupiter
