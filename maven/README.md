# How to find global settings.xml and user settings.xml in Windows
```batch
mvn -X | findstr settings.xml
```

# How to update dependencies in pom.xml using versions-maven-plugin
```batch
mvn versions:use-latest-releases
```
