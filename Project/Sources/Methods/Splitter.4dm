//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : Splitter
// Created 12/12/06 by Vincent de Lachaux
// ----------------------------------------------------
#DECLARE($position : Text; $point : Integer)

HIDE PROCESS:C324(Current process:C322)

var $x; $y; $button : Integer
MOUSE POSITION:C468($x; $y; $button)

If (Count parameters:C259=1)
	
	var $bottom; $left; $right; $top : Integer
	GET WINDOW RECT:C443($left; $top; $right; $bottom; Frontmost window:C447(*))
	
End if 

If ($position="V")
	
	If (Count parameters:C259>1)
		
		$x:=$point
		
	End if 
	
	var $winRef:=Open window:C153($left+$x; 0; $left+$x+2; Screen height:C188; -Plain dialog box:K34:4)
	
Else 
	
	If (Count parameters:C259>1)
		
		$y:=$point
		
	End if 
	
	$winRef:=Open window:C153(0; $top+$y; Screen width:C187; $top+$y+2; -Plain dialog box:K34:4)
	
End if 

DIALOG:C40("Splitter")
CLOSE WINDOW:C154