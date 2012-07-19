# SpotifyControl.scpt - Control Spotify in OS X Terminal

This is a simple AppleScript for basic control of Spotify through Terminal.app.

Currently supported functions are: play/pause, next track and previous track.

Tested to work on OS X Lion, Spotify 0.8.4.93 and iTunes 10.6.3. No guarantees.

You may use, adapt, modify etc. any way you want.

## Installation

1. Copy the the SpotifyControl.scpt file to a directory of your choosing, or just clone this repository with `git clone [URL HERE LATER]`.
2. Add the following line to your `.profile` file: 
  
  `alias spotify="osascript /path/to/SpotifyControl.scpt"`

  of course changing the path to where ever you put the script.

## Usage

* To start Spotify playback, type `spotify start` or `spotify play`.
* To pause Spotify playback, type `spotify stop` or `spotify pause`.
* To go to the next track, type `spotify next`.
* To go to the previous track, type `spotify prev` or `spotify previous`.

