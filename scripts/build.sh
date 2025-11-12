#!/bin/bash

mkdir -p ./out

CP=$(find lib -name "*.jar" | paste -sd ":" -)

kotlinc \
  $(find src/main -name "*.kt") \
  -cp "$CP" \
  -include-runtime \
  -d out/classes

jar cfe \
  ./out/app.jar \
  MainKt \
  -C out/classes \
  .