C_LONGINT:C283($Lon_Event; $Lon_Process)

$Lon_Event:=Form event code:C388

Case of 
		//______________________________________________________
	: ($Lon_Event=On Mouse Move:K2:35)
		If (Macintosh option down:C545 | Windows Alt down:C563)
			SET CURSOR:C469(9010)
		Else 
			SET CURSOR:C469(300)
		End if 
		//______________________________________________________
	: ($Lon_Event=On Mouse Leave:K2:34)
		SET CURSOR:C469
		//______________________________________________________
	: ($Lon_Event=On Clicked:K2:4)
		If (Macintosh option down:C545 | Windows Alt down:C563)
			$Lon_Process:=New process:C317("Splitter"; 0; "$4DPop_Splitter_V"; "V")
		Else 
			SET CURSOR:C469(300)
			DRAG WINDOW:C452
		End if 
		//______________________________________________________
End case 
