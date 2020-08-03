rollout MKTools "Vertex2Portal Converter"
(
    button 'addSelectionBtn' "Format Portal Positions" pos:[11,109] width:200 height:40 enabled:true align:#left
    edittext 'vertexText' "" pos:[9,18] width:200 height:89 align:#left
    button 'clearSelectionBtn' "Clear Selection" pos:[111,149] width:100 height:30 align:#left
    button 'copyBtn' "Copy To Clipboard" pos:[11,149] width:100 height:30 align:#left
    GroupBox 'grp1' "" pos:[5,4] width:212 height:182 align:#left
	on addSelectionBtn pressed do
	(	
		try
        for i in $.selectedVerts do (
            vertexText.text += i.pos.x as string + ", " + i.pos.y as string + ", " + i.pos.z as string + "\r\n"
        )
		catch
		(
			messageBox "No Vertices Selected!"
		)
		
	)
	on clearSelectionBtn pressed do
	(	
		vertexText.text = ""
	)
	on copyBtn pressed do
	(	
	local str = vertexText.text
	retCode = setclipboardText str
	)
)

utility vertex2portal_m "Vertices2Portal" (
	button open_menu "Open" width:125 height:30
    button open_cred_menu "Credits" width:75 height:20
	on open_menu pressed do
    (
        if (not MKTools.open or not MKTools.isDisplayed) do (
            if (not (menu == undefined ) and menu.placement == #minimized) then (
                menu.placement = #normal
            ) else (
		        menu = newRolloutFloater "V2P" 234 216
            )
        )
		addrollout MKTools menu
	)
    on open_cred_menu pressed do
    (
        messageBox "Created by MKRuss\r\nModified by Big Yoda"
    )
)

openUtility vertex2portal_m
