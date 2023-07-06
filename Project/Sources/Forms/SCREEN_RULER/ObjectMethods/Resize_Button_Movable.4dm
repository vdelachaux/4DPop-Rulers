C_LONGINT:C283($Lon_Event; $Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)

$Lon_Event:=Form event code:C388

Case of 
		//______________________________________________________
	: ($Lon_Event=On Mouse Move:K2:35)
		SET CURSOR:C469(9003)
		//______________________________________________________
	: ($Lon_Event=On Mouse Leave:K2:34)
		SET CURSOR:C469
		//______________________________________________________
	: ($Lon_Event=On Clicked:K2:4)
		If (Macintosh option down:C545 | Windows Alt down:C563)
			SET CURSOR:C469
			$Lon_wReference:=Current form window:C827
			GET WINDOW RECT:C443($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)
			SET WINDOW RECT:C444(0; $Lon_wTop; Screen width:C187; $Lon_wBottom; $Lon_wReference)
			OBJECT GET COORDINATES:C663(*; "@_Movable"; $Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom)
			OBJECT MOVE:C664(*; "@_Movable"; Screen width:C187-17; $Lon_wTop; Screen width:C187-6; $Lon_wBottom; *)
			OBJECT MOVE:C664(*; "Move_Window_H"; 0; 0; Screen width:C187; 25; *)
		Else 
			<>Lon_Timer_Event:=1
			SET TIMER:C645(-1)
		End if 
		//______________________________________________________
End case 

