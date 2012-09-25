# SpotifyControl.scpt - Control Spotify in OS X Terminal

This is a AppleScript for controlling Spotify through
Terminal.app.

The scenario for which it was originally designed is controlling Spotify,
which is playing on a Mac, via ssh, while working on a Linux computer 
on the other side of the room.

Currently supported functions are: play/pause, next/previous 
track, jumping in time, toggling shuffle/repeat and changing volume.
This pretty much covers everything the AppleScript hooks of Spotify
allow.

Tested to work on OS X Lion and Mountain Lion and Spotify 0.8.4.
No guarantees.

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
Remotely, Spotify will not start properly. Optionally, pass a Spotify URI as a second argument.
* To pause Spotify playback, type `spotify stop` or `spotify pause`.
* To toggle playback, type `spotify play/pause`.
* To go to the next track, type `spotify next`.
* To go to the previous track, type `spotify previous` or `spotify 
prev`.
* To print information about the currently playing track, 
type `spotify info`
* To jump to a particular time in the track, type `spotify jump N`,
where N is the track position in seconds.
* To fast forward, type `spotify forward N` where N is the number of
seconds to jump ahead.
* To rewind, type `spotify rewind N` where N is the number of
seconds to jump backwards.
* To change volume, type `spotify volume N` where N is a number between
0 and 100.
* To toggle shuffle, type `spotify shuffle`.
* To toggle repeat, type `spotify repeat`.
* To show a list of these commands, just type `spotify`.

### Over SSH

To enable the SSH server on OS X, go to Sharing in the System Preferences
and enable Remote Login. The Sharing screen will also then tell you the
command to use to connect to your Mac in the local network.
