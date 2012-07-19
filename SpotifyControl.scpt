on run argv
	set command to item 1 of argv
	using terms from application "Spotify"
		set info to "Paused."
		if command is equal to "play" or command is equal to "start" then
			tell application "Spotify"
				play
			end tell
		else if command is equal to "pause" or command is equal to "stop" then
			tell application "Spotify" to pause
		else if command is equal to "next" then
			tell application "Spotify"
				next track
			end tell
		else if command is equal to "previous" or command is equal to "prev" then
			tell application "Spotify"
				previous track
			end
		end if

		tell application "Spotify"
			if player state as text is equal to "playing"
				set info to "Now playing: " & artist of current track & " - " & name of current track
			end if
		end tell

		if command is equal to "info" then
			tell application "Spotify" 
				set myTrack to name of current track
				set myArtist to artist of current track
				set myAlbum to album of current track
				set tM to round (duration of current track / 60) rounding down
				set tS to duration of current track mod 60
				set myTime to tM as text & ":" & tS as text
				set nM to round (player position / 60) rounding down
				set nS to round (player position mod 60) rounding down
				set nowAt to nM as text & ":" & nS as text
				set info to "Now playing:"
				set info to info & "\n Artist:   " & myArtist
				set info to info & "\n Track:    " & myTrack
				set info to info & "\n Album:    " & myAlbum 
				set info to info & "\n Duration: " & mytime
				set info to info & "\n Now at:   " & nowAt
				set info to info & "\n Player:   " & player state
			end tell
		end if
	end using terms from
	info
end run

