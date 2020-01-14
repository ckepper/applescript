-- based on https://discussions.apple.com/thread/7743420

-- code to test the Mail rule script:
-- tell application "Mail"
-- 	set theSel to selection -- selected emails will be used for test
-- 	set theRule to rule "Name of Existing Mail Rule"
-- end tell
-- using terms from application "Mail"
-- 	perform mail action with messages theSel in mailboxes ("Archive - PediaPress (Alle Nachrichten)") for rule theRule
-- end using terms from

using terms from application "Mail"
	on perform mail action with messages theMessages for rule theRule
		-- Save in a sub-folder based on the name of the rule in Mail
		set ruleName to name of theRule
		tell application "Mail"
			
			set windowName to name of window 1
			repeat with eachMessage in theMessages
				
				set {year:y, month:m, day:d, hours:h, minutes:min} to eachMessage's date sent
				set timeStamp to ("" & y & "-" & my pad(m as integer) & "-" & my pad(d))
				set originalName to subject of eachMessage
				set fileName to timeStamp & " - " & ruleName & " " & originalName
				tell application "System Events" to tell process "Mail"
					set frontmost to true
					tell menu bar item "File" of menu bar 1
						click
						click menu item "Export as PDFÉ" of menu 1
					end tell
					click static text 1 of UI element 1 of row 8 of outline 1 of scroll area 1 of splitter group 1 of sheet 1 of window 1
					keystroke "g" using {command down, shift down}
					delay 0.1
					keystroke "~/Downloads"
					delay 0.1
					set value of text field 1 of sheet 1 of window 1 to fileName
					click UI element "Save" of sheet 1 of window 1
				end tell
			end repeat
		end tell
	end perform mail action with messages
end using terms from

-- Adds leading zeros to date components
on pad(n)
	return text -2 thru -1 of ("00" & n)
end pad
