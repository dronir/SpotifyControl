on run argv
	set command to item 1 of argv
	using terms from application "Spotify"
		if command is equal to "play" or command is equal to "start" then
			tell application "Spotify"
				play
				"Now playing: " & artist of current track & " - " & name of current track
			end tell
		else if command is equal to "pause" or command is equal to "stop" then
			tell application "Spotify" to pause
			"Paused."
		else if command is equal to "next" then
			tell application "Spotify"
				next track
				"Now playing: " & artist of current track & " - " & name of current track
			end tell
		else if command is equal to "previous" or command is equal to "prev" then
			tell application "Spotify"
				previous track
				"Now playing: " & artist of current track & " - " & name of current track
			end
		else if command is equal to "quit" then
			tell application "Spotify" to quit
		else if command is equal to "info" then
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
			end tell
			info
		end if
	end using terms from
end run

