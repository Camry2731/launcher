#!/bin/sh
gradle wrapper --gradle-version $(gradle --version | grep Gradle | awk '{print $2}') --distribution-type all
./gradlew clean build
read -p "Press any key to continue..."