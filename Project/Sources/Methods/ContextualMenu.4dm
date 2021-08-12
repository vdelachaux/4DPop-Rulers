//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : ContextualMenu
// Created 16/05/07 by Vincent de Lachaux
// ----------------------------------------------------
C_LONGINT:C283($Lon_x; $Lon_Process)
C_TEXT:C284($Txt_Action)
_O_C_STRING:C293(16; $a16_Menu; $a16_SubMenu)

$a16_Menu:=Create menu:C408

$a16_SubMenu:=Create menu:C408
APPEND MENU ITEM:C411($a16_SubMenu; "640 x 480")
SET MENU ITEM PARAMETER:C1004($a16_SubMenu; -1; "Screen640x480")
APPEND MENU ITEM:C411($a16_SubMenu; "800 x 600")
SET MENU ITEM PARAMETER:C1004($a16_SubMenu; -1; "Screen800x600")
APPEND MENU ITEM:C411($a16_SubMenu; "1024 x 768")
SET MENU ITEM PARAMETER:C1004($a16_SubMenu; -1; "Screen1024x768")

APPEND MENU ITEM:C411($a16_Menu; Get localized string:C991("ScreenSimulation"); $a16_SubMenu)

APPEND MENU ITEM:C411($a16_Menu; "-")
APPEND MENU ITEM:C411($a16_Menu; Get localized string:C991("DeleteGuidelines"))
SET MENU ITEM PARAMETER:C1004($a16_Menu; -1; "DeleteGuidelines")
If (Process number:C372("$4DPop_Splitter@")=0)
	DISABLE MENU ITEM:C150($a16_Menu; -1)
End if 

APPEND MENU ITEM:C411($a16_Menu; "-")
APPEND MENU ITEM:C411($a16_Menu; Get localized string:C991("CloseButton"))
SET MENU ITEM PARAMETER:C1004($a16_Menu; -1; "Close")

$Txt_Action:=Dynamic pop up menu:C1006($a16_Menu)
RELEASE MENU:C978($a16_Menu)
RELEASE MENU:C978($a16_SubMenu)

Case of 
		//______________________________________________________
	: (Length:C16($Txt_Action)=0)
		//______________________________________________________
	: ($Txt_Action="Screen@")
		$Txt_Action:=Replace string:C233($Txt_Action; "Screen"; "")
		$Lon_x:=Position:C15("x"; $Txt_Action)
		$Lon_Process:=New process:C317("Splitter"; 0; "$4DPop_Splitter_V"; "V"; Num:C11(Substring:C12($Txt_Action; 1; $Lon_x-1)))
		$Lon_Process:=New process:C317("Splitter"; 0; "$4DPop_Splitter_V"; "H"; Num:C11(Substring:C12($Txt_Action; $Lon_x+1)))
		//______________________________________________________
	: ($Txt_Action="DeleteGuidelines")
		DeleteGuidelines
		//______________________________________________________
	: ($Txt_Action="Close")
		CANCEL:C270
		//______________________________________________________
End case 
