tell application "Evernote"
	repeat until isSynchronizing is false
		--THIS EMPTY LOOP WILL PAUSE SCRIPT UNTIL PREVIOUS SYNC IS FINISHED
	end repeat
	
	set theNotes to the selection
	
	repeat with theNote in theNotes
		set theUrl to the note link of theNote
		set theTitle to the title of theNote
		
		tell application "OmniFocus"
			tell default document
				make new inbox task with properties {name:theTitle, note:theUrl}
			end tell
		end tell
	end repeat
end tell