
-- init variables
set resultMessage to ""
set removedCount to 0

-- Feel add items here
set annoyingList to {"Microsoft Edge", "Google Chrome", "Microsoft SharePoint.app"}

-- Loop through list
tell application "System Events"
	-- Fetch Login Items from System
	set loginItemsList to the name of every login item
	
	repeat with annoyingItem in annoyingList
		-- remove if found
		if loginItemsList contains annoyingItem then
			delete login item annoyingItem
			set removedCount to removedCount + 1
			set resultMessage to resultMessage & " " & annoyingItem & " Removed. 
"
		end if
	end repeat
	
	-- get the list after cleaning
	set loginItemsList to the name of every login item
	
end tell

-- Display message if anything was done
if removedCount > 0 then
	set resultMessage to resultMessage & "Login Items: "
	repeat with a from 1 to length of loginItemsList
		set theCurrentListItem to item a of loginItemsList
		if a > 1 then
			set resultMessage to resultMessage & ", "
		end if
		set resultMessage to resultMessage & theCurrentListItem
	end repeat
	
	display dialog resultMessage
end if
