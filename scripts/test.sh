#!/usr/bin/env bash
set -euo pipefail

JAR_PATH="out/app.jar"
MAIN_CLASS="MainKt"
USER_NAME="Ivan"

if [[ ! -f "$JAR_PATH" ]]; then
  echo "Integration tests require $JAR_PATH to be built" >&2
  exit 1
fi

EXPECTED_OUTPUT="Привет, {\"name\":\"${USER_NAME}\"}!"
ACTUAL_OUTPUT=$(java -cp "${JAR_PATH}:lib/*" ${MAIN_CLASS} -n "${USER_NAME}")

if [[ "$ACTUAL_OUTPUT" != "$EXPECTED_OUTPUT" ]]; then
  echo "Integration test failed" >&2
  echo "Expected: $EXPECTED_OUTPUT" >&2
  echo "Actual:   $ACTUAL_OUTPUT" >&2
  exit 1
fi

echo "Integration test passed"
