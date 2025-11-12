#!/bin/bash

mkdir -p ./out

CP=$(find lib -name "*.jar" | paste -sd ":" -)

kotlinc -cp "./out/classes:$CP" -d ./out/classes $(find src/test -name "*.kt")