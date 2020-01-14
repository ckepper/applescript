-- code to test the Mail rule script:
-- tell application "Mail"
-- 	set theSel to selection -- selected emails will be used for test
-- 	set theRule to rule "Name of existing Mail rule"
-- end tell
-- using terms from application "Mail"
-- 	perform mail action with messages theSel in mailboxes ("Archive - PediaPress (Alle Nachrichten)") for rule theRule
-- end using terms from

using terms from application "Mail"
	on perform mail action with messages theMessages for rule theRule
		-- Save in download-folder based on the name of the rule in Mail
		set businesspartner to name of theRule
		tell application "Finder"
			set attachmentsFolder to ((path to home folder as text) & "Downloads") as text
		end tell
		tell application "Mail"
			
			repeat with eachMessage in theMessages
				
				set {year:y, month:m, day:d, hours:h, minutes:min} to eachMessage's date sent
				set timeStamp to ("" & y & "-" & my pad(m as integer) & "-" & my pad(d))
				try
					-- Save the attachment
					repeat with theAttachment in eachMessage's mail attachments
						
						set originalName to name of theAttachment
						set savePath to attachmentsFolder & ":" & timeStamp & " - " & businesspartner & " " & originalName
						try
							save theAttachment in file (savePath)
						end try
					end repeat
				end try
			end repeat
			
		end tell
	end perform mail action with messages
end using terms from

-- Adds leading zeros to date components
on pad(n)
	return text -2 thru -1 of ("00" & n)
end pad