on run argv
	if count of argv is equal to 0 then
		set msg to "Use the following commands:\n"
		set msg to msg & "  start / play [uri] - Start playback / play uri\n"
		set msg to msg & "  pause / stop       - Stop playback\n"
		set msg to msg & "  next               - Next track\n"
		set msg to msg & "  previous / prev    - Previous track\n"
		set msg to msg & "  info               - Print track info\n"
		set msg to msg & "  jump N             - Jump to N seconds in the song\n"
		set msg to msg & "  forward N          - Jump N seconds forwards\n"
		set msg to msg & "  rewind N           - Jump N seconds backwards\n"
		set msg to msg & "  shuffle            - Toggle shuffle\n"
		set msg to msg & "  repeat             - Toggle repeat\n"
		return msg
	end if
	set command to item 1 of argv
	using terms from application "Spotify"
		set info to "Error."
		if command is equal to "play" or command is equal to "start" then
			if count of argv is equal to 1 then
				tell application "Spotify" to play
			else
				set uri to item 2 of argv
				tell application "Spotify" to play track uri
			end if	
		else if command is equal to "pause" or command is equal to "stop" then
			tell application "Spotify" to pause
			return "Paused."
			
		else if command is equal to "next" then
			tell application "Spotify" to next track

		else if command is equal to "previous" or command is equal to "prev" then
			tell application "Spotify" to previous track
			
		else if command is equal to "jump"
			set jumpTo to item 2 of argv as real
			tell application "Spotify"
				set tMax to duration of current track
				if jumpTo > tMax
					return "Can't jump past end of track."
				else if jumpTo < 0
					return "Can't jump past start of track."
				end if
				set nM to round (jumpTo / 60) rounding down
				set nS to round (jumpTo mod 60) rounding down
				set newTime to nM as text & "min " & nS as text & "s"
				set player position to jumpTo
				return "Jumped to " & newTime
			end tell
			
		else if command is equal to "forward"
			set jump to item 2 of argv as real
			tell application "Spotify"
				set now to player position
				set tMax to duration of current track
				set jumpTo to now + jump
				if jumpTo > tMax
					return "Can't jump past end of track."
				else if jumpTo < 0
					set jumpTo to 0
				end if
				set nM to round (jumpTo / 60) rounding down
				set nS to round (jumpTo mod 60) rounding down
				set newTime to nM as text & "min " & nS as text & "s"
				set player position to jumpTo
				return "Jumped to " & newTime
			end tell
			
		else if command is equal to "rewind"
			set jump to item 2 of argv as real
			tell application "Spotify"
				set now to player position
				set tMax to duration of current track
				set jumpTo to now - jump
				if jumpTo > tMax
					return "Can't jump past end of track."
				else if jumpTo < 0
					set jumpTo to 0
				end if
				set nM to round (jumpTo / 60) rounding down
				set nS to round (jumpTo mod 60) rounding down
				set newTime to nM as text & "min " & nS as text & "s"
				set player position to jumpTo
				return "Jumped to " & newTime
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
				set info to "Current track:"
				set info to info & "\n Artist:   " & myArtist
				set info to info & "\n Track:    " & myTrack
				set info to info & "\n Album:    " & myAlbum 
				set info to info & "\n URI:      " & spotify url of current track
				set info to info & "\n Duration: " & mytime & " ("& duration of current track & " seconds)" 
				set info to info & "\n Now at:   " & nowAt
				set info to info & "\n Player:   " & player state
				if shuffling then set info to info & "\n Shuffle is on."
				if repeating then set info to info & "\n Repeat is on."
			end tell
			return info
		end if
		
		tell application "Spotify"
			set shuf to ""
			if shuffling then set shuf to "\n[shuffle on]"
			if player state as text is equal to "playing"
				return "Now playing: " & artist of current track & " - " & name of current track & shuf
			end if
		end tell
	end using terms from
end run

