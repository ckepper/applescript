-- automatically click a confirmation link in an email message
using terms from application "Mail"
	on perform mail action with messages theMessages
		repeat with eachMessage in theMessages
			-- Get the link from the current Message:
			set theText to source of eachMessage
			set P1 to offset of "https://175spenden" in theText
			set theLink to rich text P1 through (P1 + 87) of theText
			tell application "Safari" to open location theLink
		end repeat
	end perform mail action with messages
end using terms from
