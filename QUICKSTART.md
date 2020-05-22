These set of tutorials help you distribute a modpack with the launcher. The tutorial is aimed towards someone with little technical knowledge.

There are four major parts:

1. First, the tutorial asks you to run some simple commands to create an executable launcher. At this point, the launcher doesn't have your own custom graphics or title yet.
2. Then, it asks you to upload some sample files to a website to make sure you can get it to work.
3. Then, you are given a tour of the modpack creation tools. You'll be able to test if your modpack works.
4. Lastly, you are told how you can customize the launcher so it has your graphics, your name, and it's linked to your modpacks.

You'll have something to test after every major step, so you can tell if everything is working for you.

If you ever need help during one of these steps, see [[Getting Help]].

## Requirements

Most of the tutorial just involves clicking buttons, entering values, or putting files in the right folder.

However, the exception is that you need to have a website you can put files on. If you already have one, you can skip this section.

Don't worry if you don't have a website! Fortunately, there's OpenShift, which provides free website hosting. If you want to use OpenShift, we currently have [tutorial for users of Microsoft Windows](https://github.com/SKCraft/Launcher/wiki/OpenShift-Tutorial-%28Windows%29). If you use Mac OS X or Linux, then I'm afraid we haven't written one yet (but [[check out our forums|Getting Help]] and we'll see about helping you).

Instead of OpenShift, **Dropbox might work too, but you need an old account with a "Public" folder** because Dropbox removed this feature for new users. Use our [user ID finder tool](https://github.com/SKCraft/Launcher/releases/download/creator-2.0.1/dropboxgetuser.jar) and then your "website" is at `https://dl.dropboxusercontent.com/u/00000/` where 00000 is your ID. To test if it works, put an  image.jpg file into your Public folder, and then check if `https://dl.dropboxusercontent.com/u/YOUR_USER_ID/image.jpg` loads.
## Compiling the Launcher

1. Install the [Java Development Kit (JDK)](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) (version 8 or newer required!).
2. Download [the source code](https://github.com/SKCraft/Launcher/archive/master.zip).
3. Extract it somewhere.
2. Do one of the following in the extracted folder:
    * Windows users: Double click `build.bat`
    * Linux/BSD users: Open a terminal, `cd /path/to/launcher`, and run `./build.sh`
    * Mac OS X users: Open Terminal, `cd /path/to/launcher`, and run `./build.sh`
    * Or via terminal: `./gradlew clean build`

If it worked, then you should see something like:

![Compilation in Progress](http://i.imgur.com/BiWzpS2.png)

### What was just created?

You will find several .jars that were just created in the following folders:

* `creator-tools/build/libs/` has a full-blown GUI for making mod packs.
* `launcher/build/libs/` has the launcher.
* `launcher-fancy/build/libs/` has the black version of the launcher.
* `launcher-bootstrap/build/libs/` has the wrapper program that auto-updates.
* `launcher-builder/build/libs/` has command-line tools for creating modpacks.

In all these folders will be two .jar files, but **always use the one ending in -all.jar**!

Now, if you want to run the launcher, double click the -all.jar in launcher/build/libs. Try the fancy black one too. Also try the "creator-tools" one (NOTE: the creator tools require Java 8+, unlike the launcher which only requires Java 6+).

**License Information:** The launcher is licensed under the open source LGPL license. If you make changes to the launcher's source code, you are legally obligated to release those changes if you release your launcher copy.

## Upload Sample Files

We recommend uploading the sample (but fake) modpacks to your web server or Dropbox so we can see if your setup works. 

1. Find the `sample-files/upload/` folder and upload its contents to your website.
	* If you are using FTP to upload, make sure to upload in "binary mode."
	* If you are using Dropbox, put it into your Public folder.
2. Try visiting the following URLs, where `http://example.com` is your site instead:
	* `http://example.com/news.html`
	* `http://example.com/packages.json`
	* `http://example.com/latest.json`

(If you are using Dropbox, remember that the links must start with `https://dl.dropboxusercontent.com/u/00000/` where 00000 is your user ID.)

### Check If Everything Works

The pages SHOULD load. The news.html page should also look like this:

![News Page Example](http://i.imgur.com/13XsSOI.png)

If you have PHP installed (or think that you do), visit `http://example.com/packages.php` and make sure it looks the same as packages.json. If it doesn't, then you probably don't have PHP.

## Customizing the Launcher

Open up the `launcher/src/main/resources/com/skcraft/launcher` folder. We'll be changing the files in this folder to customize the launcher.

![Customization Files](http://i.imgur.com/adr5y4R.png)

1. Open up `launcher.properties` in your favorite text editor. For Windows users, we recommend [Notepad++](http://notepad-plus-plus.org/).
2. Change `newsUrl`, `packageListUrl`, and `selfUpdateUrl` to the URLs that you just tested:

	```
	newsUrl=http://example.com/news.html
	packageListUrl=http://example.com/packages.json
	selfUpdateUrl=http://example.com/latest.json
	```

	If you have PHP support, use "packages.php" instead of "packages.json."
3. Change the images (you can also do it later).

## Testing the Changes

Recompile the launcher again. If you already forgot how to:

* Windows users: Double click `build.bat`
* Linux/BSD users: Open a terminal, `cd /path/to/launcher`, and run `./build.sh`
* Mac OS X users: Open Terminal, `cd /path/to/launcher`, and run `./build.sh`
* Or via terminal: `./gradlew clean build`

After it's done, go to the folder `launcher/build/libs/` and start the launcher by double clicking the `-all.jar` file.

![Launcher Binary](http://i.imgur.com/zFaIEow.png)

If everything worked correctly, you should see "Light Modpack" and "Monster Modpack" in the launcher on the left. Double click one of the modpacks, enter your Minecraft account, and see if the game loads. 

![Launcher](http://i.imgur.com/hwWenPu.png)

This launcher version is "portable," so it stores its data files in the current folder. If you look into the `launcher/build/libs/` folder, you will find a bunch of launcher files (`accounts.dat`, `config.json`, etc.). Later on, there will be instructions on setting up a "bootstrapper" so that the launcher isn't in portable mode (unless you prefer it that way).

## Next Steps

So far, so good. Onto the next page: [[Creating Modpacks]]