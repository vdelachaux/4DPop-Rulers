// ----------------------------------------------------
// Method : Méthode formulaire : Splitter
// Created 12/12/06 by Vincent de Lachaux 
// ----------------------------------------------------
C_LONGINT:C283($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_Event; $Lon_wReference)

$Lon_Event:=Form event code:C388

Case of 
		//…………………………………………
	: ($Lon_Event=On Timer:K2:25)
		SET TIMER:C645(0)
		$Lon_wReference:=Current form window:C827
		GET WINDOW RECT:C443($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)
		If (($Lon_wRight-$Lon_wLeft)<20)
			SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wLeft+1; $Lon_wBottom; $Lon_wReference)
		Else 
			SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wTop+1; $Lon_wReference)
		End if 
		SHOW PROCESS:C325(Current process:C322)
		BRING TO FRONT:C326(Current process:C322)
		//…………………………………………
	: ($Lon_Event=On Load:K2:1)
		SET TIMER:C645(-1)
		//…………………………………………
	: ($Lon_Event=On Outside Call:K2:11)
		CANCEL:C270
		//…………………………………………
End case 