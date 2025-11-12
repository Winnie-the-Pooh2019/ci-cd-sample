#!/bin/bash

# Configuration
MAIN_CLASS="MainKt"
OUTPUT_JAR="app-fat.jar"
SRC_DIR="src/main"
LIB_DIR="lib"
BUILD_DIR="out"

rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR/classes
mkdir -p $BUILD_DIR/extracted

echo "Compiling Kotlin sources..."
CP=$(find "$LIB_DIR" -name "*.jar" | paste -sd ":" -)
kotlinc -cp "$CP" -d $BUILD_DIR/classes -include-runtime $(find $SRC_DIR -name "*.kt")

echo "Extracting dependencies..."
for jar in $LIB_DIR/*.jar; do
    unzip -qq -o "$jar" -d $BUILD_DIR/extracted
done

cp -r $BUILD_DIR/classes/* $BUILD_DIR/extracted/

cat > $BUILD_DIR/MANIFEST.MF << EOF
Manifest-Version: 1.0
Main-Class: $MAIN_CLASS

EOF

echo "Creating fat JAR..."
cd $BUILD_DIR/extracted
jar cfm ../$OUTPUT_JAR ../MANIFEST.MF .
cd ../..

echo "Fat JAR created: $OUTPUT_JAR"