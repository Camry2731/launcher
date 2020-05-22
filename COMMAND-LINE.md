You can build modpacks via command line tools as well.

## Building Modpacks

Get the .jar from the `launcher-builder/build/libs/` folder.

```
java -jar launcher-builder-X.Y.Z-SNAPSHOT-all.jar
    --version "pick_a_version"
    --input .
    --output upload
    --manifest-dest "upload/your_modpack.json" 
```

* "version" is the version of your modpack and it doesn't have to be a number -- whenever you want to push an update, you have to change the version code to anything else that has never been used before 
* "input" is the folder with "loaders," "src," and "modpack.json" -- `.` means "the current folder"
* "output" is the folder to put the output
* "manifest-dest" is the manifest file that is generated

![Command Prompt](http://i.imgur.com/Nt7nCHV.png)

There should be a `upload/` folder now with the generated files.

![Generated Files](http://i.imgur.com/LLkHRSk.png)

## Deploying the Server

See [[Deploying Server Modpacks]].

## Generating a Package Listing

There is no command line tool to do this. However, the format of packages.json is pretty simple so you should be able to generate it yourself easily.