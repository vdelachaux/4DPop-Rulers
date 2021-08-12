//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : Splitter
// Created 12/12/06 by Vincent de Lachaux 
// ----------------------------------------------------
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_LONGINT:C283($Lon_X; $Lon_Y; $Lon_Button; $Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)

HIDE PROCESS:C324(Current process:C322)

GET MOUSE:C468($Lon_X; $Lon_Y; $Lon_Button)
If (Count parameters:C259=1)
	GET WINDOW RECT:C443($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; Frontmost window:C447(*))
End if 

If ($1="V")
	If (Count parameters:C259>1)
		$Lon_X:=$2
	End if 
	$Lon_wReference:=Open window:C153($Lon_wLeft+$Lon_X; 0; $Lon_wLeft+$Lon_X+2; Screen height:C188; -Plain dialog box:K34:4)
Else 
	If (Count parameters:C259>1)
		$Lon_Y:=$2
	End if 
	$Lon_wReference:=Open window:C153(0; $Lon_wTop+$Lon_Y; Screen width:C187; $Lon_wTop+$Lon_Y+2; -Plain dialog box:K34:4)
End if 

DIALOG:C40("Splitter")
CLOSE WINDOW:C154
