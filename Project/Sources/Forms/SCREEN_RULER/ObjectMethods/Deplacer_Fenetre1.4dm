var $Lon_Event; $Lon_Process : Integer

$Lon_Event:=Form event code:C388

Case of 
		//______________________________________________________
	: ($Lon_Event=On Mouse Move:K2:35)
		If (Macintosh option down:C545) | (Windows Alt down:C563)
			SET CURSOR:C469(9011)
		Else 
			SET CURSOR:C469(300)
		End if 
		//______________________________________________________
	: ($Lon_Event=On Mouse Leave:K2:34)
		SET CURSOR:C469
		//______________________________________________________
	Else 
		If (Macintosh option down:C545 | Windows Alt down:C563)
			$Lon_Process:=New process:C317("Splitter"; 0; "$4DPop_Splitter_H"; "H")
		Else 
			SET CURSOR:C469(300)
			DRAG WINDOW:C452
		End if 
		//______________________________________________________
End case 