// ----------------------------------------------------
// Method : Méthode formulaire : 4DPop_ScreenRuler
// Alias : zPop_Screen_Ruler
// Created 17/09/02 par Vincent de Lachaux
// ----------------------------------------------------
// Modified by Vincent de Lachaux (12/12/06)
// for v11 and adding mouse tracking
// ----------------------------------------------------
var $Lon_Bottom; $Lon_Button; $Lon_Event; $Lon_Height; $Lon_Left; $Lon_Offset : Integer
var $Lon_Page; $Lon_Right; $Lon_Top; $Lon_wBottom; $Lon_Width; $Lon_wLeft : Integer
var $Lon_wReference; $Lon_wRight; $Lon_wTop : Integer

$Lon_Event:=Form event code:C388
$Lon_wReference:=Current form window:C827
$Lon_Page:=FORM Get current page:C276


var <>Lon_Timer_Event; <>Lon_X; <>Lon_Y; <>Lon_Unit : Integer

Case of 
		//________________________________________________________________________________
	: ($Lon_Event=On Timer:K2:25)
		SET TIMER:C645(0)
		$Lon_Event:=<>Lon_Timer_Event
		<>Lon_Timer_Event:=0
		GET WINDOW RECT:C443($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)
		MOUSE POSITION:C468(<>Lon_X; <>Lon_Y; $Lon_Button)
		
		Case of 
				//______________________________________________________
			: ($Lon_Event=1)
				SET CURSOR:C469(9003)
				If ($Lon_Button#0)
					<>Lon_X:=$Lon_wLeft+<>Lon_X
					$Lon_Offset:=<>Lon_X-$Lon_wRight+6
					$Lon_Width:=($Lon_wRight+$Lon_Offset)-$Lon_wLeft
					Case of 
							//______________________________________________________
						: ($Lon_Width<65)
							//______________________________________________________
						Else 
							SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wRight+$Lon_Offset; $Lon_wBottom; $Lon_wReference)
							OBJECT MOVE:C664(*; "@_Movable"; $Lon_Offset; 0)
							//______________________________________________________
					End case 
					<>Lon_Timer_Event:=1
				Else 
					SET CURSOR:C469
					OBJECT MOVE:C664(*; "Move_Window_H"; 0; 0; $Lon_wRight-$Lon_wLeft; 25; *)
				End if 
				//______________________________________________________
			: ($Lon_Event=2)
				SET CURSOR:C469
				If (($Lon_wRight-$Lon_wLeft)<($Lon_wBottom-$Lon_wTop))  //Vertical
					OBJECT GET COORDINATES:C663(*; "Resize_Button_Movable"; $Lon_Left; $Lon_Top; $Lon_Right; $Lon_Bottom)
					SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wLeft+$Lon_Right+6; $Lon_wTop+50; $Lon_wReference)
					FORM GOTO PAGE:C247(1)
				Else 
					SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wLeft+50; Screen height:C188; $Lon_wReference)
					FORM GOTO PAGE:C247(2)
				End if 
				//______________________________________________________
			: ($Lon_Event=3)
				OBJECT SET VISIBLE:C603(*; "H_@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "V_@"; False:C215)
				<>Lon_Unit:=<>Lon_Unit+1
				If (<>Lon_Unit>4)
					<>Lon_Unit:=1
				End if 
				OBJECT SET VISIBLE:C603(*; "@"+String:C10(<>Lon_Unit); True:C214)
				var <>Txt_Unit:=Localized string:C991("Unit_"+String:C10(<>Lon_Unit+Num:C11((<>Lon_Unit=4) & ($Lon_Page=2))))
				//______________________________________________________
		End case 
		
		If ($Lon_Page=1)
			
			Case of 
					//………………………
				: (<>Lon_X<30)
					$Lon_Top:=30
					//………………………
				: (<>Lon_X<80)
					$Lon_Top:=17
					//………………………
				: (<>Lon_X>(($Lon_wRight-$Lon_wLeft)-55))
					$Lon_Top:=17
					//………………………
				Else 
					$Lon_Top:=0
					//………………………
			End case 
			
			OBJECT MOVE:C664(*; "Repere_V"; <>Lon_X; $Lon_Top; <>Lon_X+1; 50; *)
			
			OBJECT GET COORDINATES:C663(*; "Repere_V_Box"; $Lon_Left; $Lon_Top; $Lon_Right; $Lon_Bottom)
			$Lon_Width:=$Lon_Right-$Lon_Left
			$Lon_Offset:=2
			<>Lon_X:=<>Lon_X+1
			$Lon_Left:=<>Lon_X+$Lon_Offset
			$Lon_Right:=$Lon_Left+$Lon_Width+$Lon_Offset
			If ($Lon_Left>80)
				If (<>Lon_X>(($Lon_wRight-$Lon_wLeft)-20-$Lon_Width-($Lon_Offset*2)))
					$Lon_Left:=(($Lon_wRight-$Lon_wLeft)-20)-$Lon_Width-($Lon_Offset*2)
				End if 
			Else 
				$Lon_Left:=80
			End if 
			
			OBJECT MOVE:C664(*; "Repere_V_Box"; $Lon_Left; $Lon_Top; $Lon_Left+$Lon_Width; $Lon_Bottom; *)
			OBJECT SET VISIBLE:C603(*; "Repere_V"; True:C214)
			
		Else 
			
			Case of 
					//………………………
				: (<>Lon_Y<44)
					$Lon_Left:=18
					//………………………
				: (<>Lon_Y<85)
					$Lon_Left:=37
					//………………………
				Else 
					$Lon_Left:=0
					//………………………
			End case 
			
			OBJECT MOVE:C664(*; "Repere_H"; $Lon_Left; <>Lon_Y-1; 50; <>Lon_Y; *)
			
			OBJECT GET COORDINATES:C663(*; "Repere_H_Box"; $Lon_Left; $Lon_Top; $Lon_Right; $Lon_Bottom)
			$Lon_Height:=$Lon_Bottom-$Lon_Top
			$Lon_Offset:=2
			$Lon_Top:=<>Lon_Y+$Lon_Offset
			$Lon_Bottom:=$Lon_Top+$Lon_Height+$Lon_Offset
			
			If ($Lon_Top>90)
				If (<>Lon_Y>($Lon_Top-$Lon_Width-($Lon_Offset*2)))
					If (<>Lon_Y>($Lon_wBottom-$Lon_wTop))
						$Lon_Top:=$Lon_wBottom-$Lon_wTop-$Lon_Height-($Lon_Offset*2)
					Else 
						$Lon_Top:=<>Lon_Y-($Lon_Offset*2)-$Lon_Height
					End if 
				End if 
			Else 
				$Lon_Top:=70
			End if 
			
			OBJECT MOVE:C664(*; "Repere_H_Box"; $Lon_Left; $Lon_Top; $Lon_Right; $Lon_Top+$Lon_Height; *)
			OBJECT SET VISIBLE:C603(*; "Repere_H"; True:C214)
			
		End if 
		
		If (<>Lon_Timer_Event#0)
			SET TIMER:C645(-1)
		Else 
			SET TIMER:C645(5)
		End if 
		//________________________________________________________________________________
	: ($Lon_Event=On Load:K2:1)
		<>Lon_Unit:=4
		<>Lon_Timer_Event:=3
		SET TIMER:C645(2)
		//________________________________________________________________________________
	: ($Lon_Event=On Activate:K2:9)
		GET WINDOW RECT:C443($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)
		SET WINDOW RECT:C444($Lon_wLeft; $Lon_wTop; $Lon_wRight; $Lon_wBottom; $Lon_wReference)
		//________________________________________________________________________________
	: ($Lon_Event=On Unload:K2:2)
		DeleteGuidelines
		//________________________________________________________________________________
End case 