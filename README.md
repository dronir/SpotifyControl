# SpotifyControl.scpt - Control Spotify in OS X Terminal

This is a simple AppleScript for basic control of Spotify through
Terminal.app.

The scenario that it was originally designed for is to control Spotify 
which is playing on a Mac,  via ssh, while working on a Linux computer 
on the other side  of the room.

Currently supported functions are: play/pause, next track and previous 
track.

Tested to work on OS X Lion, Spotify 0.8.4.93 and iTunes 10.6.3. No 
guarantees.

You may use, adapt, modify etc. any way you want.


## Installation

I am assuming that if you need to control Spotify through the terminal 
you know enough about terminal usage.

The simplest way to install the script is just to just download the 
script file from the GitHub page and add the line `alias 
spotify="osascript /path/to/SpotifyControl.scpt"` in your `.profile`.

If you have `git`, even simpler will be to clone this repository with 
`git clone git://github.com/dronir/SpotifyControl.git` and then edit 
`.profile` as above. This will also make it easy to keep up to date 
with possible updates to the script.


## Usage

* To start Spotify playback, type `spotify start` or `spotify play`. 
If you do this locally and Spotify is not running, it will start. 
Remotely, Spotify will not start properly.
* To pause Spotify playback, type `spotify stop` or `spotify pause`.
* To go to the next track, type `spotify next`.
* To go to the previous track, type `spotify previous` or `spotify 
prev`.
* To print information about the currently playing track, 
type `spotify info`

### Over SSH

To enable the SSH server on OS X, go to Sharing in the System Preferences
and enable Remote Login. The Sharing screen will also then tell you the
command to use to connect to your Mac in the local network.