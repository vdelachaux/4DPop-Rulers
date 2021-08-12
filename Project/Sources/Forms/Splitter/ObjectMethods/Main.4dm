C_LONGINT:C283($Lon_Event; $Lon_Cursor; $Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference; $Lon_Unused)

$Lon_Event:=Form event code:C388
$Lon_wReference:=Current form window:C827
GET WINDOW RECT:C443($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)
If (($Lon_wBottom-$Lon_wTop)>($Lon_wRight-$Lon_wLeft))
	$Lon_Cursor:=500
Else 
	$Lon_Cursor:=352
End if 

Case of 
		//______________________________________________________
	: ($Lon_Event=On Mouse Move:K2:35)
		SET CURSOR:C469($Lon_Cursor)
		//______________________________________________________
	: ($Lon_Event=On Mouse Leave:K2:34)
		SET CURSOR:C469
		//______________________________________________________
	: ($Lon_Event=On Clicked:K2:4)
		
		If (Macintosh option down:C545 | Windows Alt down:C563)
			
			CANCEL:C270
			
		Else 
			
			SET CURSOR:C469($Lon_Cursor)
			
			DRAG WINDOW:C452
			
			If (($Lon_wRight-$Lon_wLeft)<20)  //Vertical
				
				GET WINDOW RECT:C443($Lon_wLeft; $Lon_Unused; $Lon_wRight; $Lon_Unused; $Lon_wReference)
				SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wLeft+1; $Lon_wBottom; $Lon_wReference)
				
			Else 
				
				GET WINDOW RECT:C443($Lon_Unused; $Lon_wTop; $Lon_wRight; $Lon_Unused; $Lon_wReference)
				SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wTop+1; $Lon_wReference)
				
			End if 
			
		End if 
		//______________________________________________________
End case 
