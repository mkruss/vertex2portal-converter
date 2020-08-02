macroScript Portal_cleaner category:"MKRuss Tools" tooltip:"Vertex2Portal Converter"
(
rollout MKTools "Vertex2Portal Converter" width:260 height:270
(
	button 'addSelectionBtn' "Add Vertex" pos:[30,120] width:200 height:40 enabled:true align:#left
	edittext 'vertexText' "" pos:[30,30] width:200 height:86 align:#left
	button 'clearSelectionBtn' "Clear Selection" pos:[130,170] width:100 height:30 align:#left

	button 'copyBtn' "Copy To Clipboard" pos:[30,170] width:100 height:30 align:#left
	button 'btn13' "Close" pos:[150,220] width:80 height:30 align:#left
	GroupBox 'grp1' "" pos:[10,10] width:240 height:250 align:#left
	
	on addSelectionBtn pressed do
	(	
		try		
		vertexText.text += $.selectedVerts[1].pos.x as string + ", " + $.selectedVerts[1].pos.y as string + ", " + $.selectedVerts[1].pos.z as string + "\r\n"
		catch
		(
			messageBox "No Vertex Selected!"
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
	on btn13 pressed do
		destroyDialog MKTools
)
Createdialog MKTools
)
