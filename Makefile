target_dir = ~/Library/Application\ Scripts/com.apple.mail/
install::
	osacompile -o ${target_dir}save_Attachment_to_Downloads_Folder.scpt mail/save_Attachment_to_Downloads_Folder.applescript
	osacompile -o ${target_dir}save_Message_to_Downloads_Folder.scpt mail/save_Message_to_Downloads_Folder.applescript
	osacompile -o ${target_dir}auto_confirm_link.scpt mail/auto_confirm_link.applescript
