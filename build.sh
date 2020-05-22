#!/bin/bash
gradle wrapper --gradle-version $(gradle --version | grep Gradle | awk '{print $2}') --distribution-type all
./gradlew clean build
echo "Build complete."
