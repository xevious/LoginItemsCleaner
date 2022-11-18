tell application "System Events"
	set resultMessage to ""
	set loginItemsList to the name of every login item
	set removedCount to 0
	
	if loginItemsList contains "Microsoft Edge" then
		delete login item "Microsoft Edge"
		set removedCount to removedCount + 1
		set resultMessage to resultMessage & "Edge Removed. 
"
	end if
	if loginItemsList contains "Google Chrome" then
		delete login item "Google Chrome"
		set removedCount to removedCount + 1
		set resultMessage to resultMessage & "Chrome Removed. 
"
	end if
	set loginItemsList to the name of every login item
	
	set resultMessage to resultMessage & "Login Items: "
	repeat with a from 1 to length of loginItemsList
		set theCurrentListItem to item a of loginItemsList
		if a > 1 then
			set resultMessage to resultMessage & ", "
		end if
		set resultMessage to resultMessage & theCurrentListItem
	end repeat
	
	if removedCount > 0 then
		display dialog resultMessage
	end if
end tell