on run argv
	set command to item 1 of argv
	using terms from application "Spotify"
		set info to "Error."
		if command is equal to "play" or command is equal to "start" then
			tell application "Spotify"
				play
			end tell
		else if command is equal to "pause" or command is equal to "stop" then
			tell application "Spotify" to pause
			return "Paused."
		else if command is equal to "next" then
			tell application "Spotify"
				next track
			end tell
		else if command is equal to "previous" or command is equal to "prev" then
			tell application "Spotify"
				previous track
			end tell
			
		else if command is equal to "jump"
			set jumpTo to item 2 of argv as real
			tell application "Spotify"
				set tMax to duration of current track
				if jumpTo < tMax
					set realT to jumpTo
				else
					return "Can't jump past end of track."
				end if
				set nM to round (realT / 60) rounding down
				set nS to round (realT mod 60) rounding down
				set newTime to nM as text & "min " & nS as text & "s"
				set player position to realT
				return "Jumped to " & newTime
			end tell
		else if command is equal to "forward"
			set jumpTo to item 2 of argv as real
			tell application "Spotify"
				set now to player position
				set tMax to duration of current track
				if now + jumpTo < tMax
					set realT to now + jumpTo
				else
					return "Can't jump past end of track."
				end if
				set nM to round (realT / 60) rounding down
				set nS to round (realT mod 60) rounding down
				set newTime to nM as text & "min " & nS as text & "s"
				set player position to realT
				return "Jumped forward "& jumpTo &" seconds to " & newTime
			end tell
		else if command is equal to "rewind"
			set jumpTo to item 2 of argv as real
			tell application "Spotify"
				set now to player position
				set tMax to duration of current track
				if now - jumpTo > 0
					set realT to now - jumpTo
				else
					set realT to 0
				end if
				set nM to round (realT / 60) rounding down
				set nS to round (realT mod 60) rounding down
				set newTime to nM as text & "min " & nS as text & "s"
				set player position to realT
				return "Jumped backwards "& jumpTo &" seconds to " & newTime
			end tell
			
		else if command is equal to "volume" then
			set newVolume to item 2 of argv as real
			if newVolume < 0 then set newVolume to 0
			if newVolume > 100 then set newVolume to 100
			tell application "Spotify"
				set sound volume to newVolume
			end tell
			return "Changed volume to " & newVolume
		
		else if command is equal to "shuffle" then
			tell application "Spotify"
				set shuffling to not shuffling
				return "Shuffle is now " & shuffling
			end tell

		else if command is equal to "repeat" then
			tell application "Spotify"
				set repeating to not repeating
				return "Repeat is now " & repeating
			end tell
			
		else if command is equal to "info" then
			tell application "Spotify" 
				set myTrack to name of current track
				set myArtist to artist of current track
				set myAlbum to album of current track
				set tM to round (duration of current track / 60) rounding down
				set tS to duration of current track mod 60
				set myTime to tM as text & "min " & tS as text & "s"
				set nM to round (player position / 60) rounding down
				set nS to round (player position mod 60) rounding down
				set nowAt to nM as text & "min " & nS as text & "s"
				set info to "Now playing:"
				set info to info & "\n Artist:   " & myArtist
				set info to info & "\n Track:    " & myTrack
				set info to info & "\n Album:    " & myAlbum 
				set info to info & "\n Duration: " & mytime & " ("& duration of current track & " seconds)" 
				set info to info & "\n Now at:   " & nowAt
				set info to info & "\n Player:   " & player state
				set info to info & "\n URI:      " & spotify url of current track
			end tell
			return info
		end if
		tell application "Spotify"
			if player state as text is equal to "playing"
				return "Now playing: " & artist of current track & " - " & name of current track
			end if
		end tell
	end using terms from
end run

