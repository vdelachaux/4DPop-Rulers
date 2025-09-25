//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : ContextualMenu
// Created 16/05/07 by Vincent de Lachaux
// ----------------------------------------------------
var $menu:=Create menu:C408
var $submenu:=Create menu:C408

APPEND MENU ITEM:C411($submenu; "640 x 480")
SET MENU ITEM PARAMETER:C1004($submenu; -1; "Screen640x480")
APPEND MENU ITEM:C411($submenu; "800 x 600")
SET MENU ITEM PARAMETER:C1004($submenu; -1; "Screen800x600")
APPEND MENU ITEM:C411($submenu; "1024 x 768")
SET MENU ITEM PARAMETER:C1004($submenu; -1; "Screen1024x768")

APPEND MENU ITEM:C411($menu; Localized string:C991("ScreenSimulation"); $submenu)

APPEND MENU ITEM:C411($menu; "-")
APPEND MENU ITEM:C411($menu; Localized string:C991("DeleteGuidelines"))
SET MENU ITEM PARAMETER:C1004($menu; -1; "DeleteGuidelines")

If (Process number:C372("$4DPop_Splitter@")=0)
	
	DISABLE MENU ITEM:C150($menu; -1)
	
End if 

APPEND MENU ITEM:C411($menu; "-")
APPEND MENU ITEM:C411($menu; Localized string:C991("CloseButton"))
SET MENU ITEM PARAMETER:C1004($menu; -1; "Close")

var $choice:=Dynamic pop up menu:C1006($menu)
RELEASE MENU:C978($menu)
RELEASE MENU:C978($submenu)

Case of 
		
		// ______________________________________________________
	: (Length:C16($choice)=0)
		
		// ______________________________________________________
	: ($choice="Screen@")
		
		$choice:=Replace string:C233($choice; "Screen"; "")
		var $Lon_x:=Position:C15("x"; $choice)
		var $Lon_Process:=New process:C317("Splitter"; 0; "$4DPop_Splitter_V"; "V"; Num:C11(Substring:C12($choice; 1; $Lon_x-1)))
		$Lon_Process:=New process:C317("Splitter"; 0; "$4DPop_Splitter_V"; "H"; Num:C11(Substring:C12($choice; $Lon_x+1)))
		// ______________________________________________________
	: ($choice="DeleteGuidelines")
		
		DeleteGuidelines
		// ______________________________________________________
	: ($choice="Close")
		
		CANCEL:C270
		// ______________________________________________________
End case 