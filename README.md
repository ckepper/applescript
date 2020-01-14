A collection of AppleScript files for personal use (e.g. as Apple Mail filters)

# Mail Scripts
This is a small collection of scripts for use with [Apple Mail](https://en.wikipedia.org/wiki/Apple_Mail). They are very helpful in managing incoming email at scale. All messages are filed to `~/Downloads` where they can be further processed and filed by a tool like the awesome [Hazel](https://www.noodlesoft.com/).

## Save Attachments 
file `save_Attachment_to_Downloads_Folder.applescript`
* This is a script for use with an Apple Mail rule. 
* Saves all **attachments** of the matched message in `~/Downloads` folder
* Rename attachment to current date in ISO 8601 format and adds the name of the rule: 
  * `2020-01-01 - RuleName originalAttachmentFileName.pdf`

## Export Messages as PDF
file `save_Message_to_Downloads_Folder.applescript`
* This is a script for use with an Apple Mail rule. 
* export matched **messages** as PDF to `~/Downloads` folder
* Rename attachment to current date in ISO 8601 format and adds the name of the rule: 
  * `2020-01-01 - RuleName MessageSubject.pdf`


## Getting Started
The scripts must be stored in `~/Library/Application\ Scripts/com.apple.mail` to be picked up by Apple Mail. You can either copy the files manually or rely on the pre-configured VS Code tasks to do that:

* Run `setup_symlinks.sh` to create a symlink to `~/Library/Application\ Scripts/com.apple.mail`. This enables the compilation tasks.
* Run the `Compile ...` tasks to compile a script and store it in the `~/Library/Application\ Scripts/com.apple.mail` directory