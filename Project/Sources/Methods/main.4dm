//%attributes = {}
#DECLARE($data : Object)

var $task:="$4DPop_Ruler"

If (Process info:C1843(Current process:C322).name#$task)
	
	var $process:=New process:C317(Current method name:C684; 0; $task; *)
	
Else 
	
	var $form:="SCREEN_RULER"
	
	var $height; $width : Integer
	FORM GET PROPERTIES:C674($form; $width; $height)
	var $offset:=Menu bar height:C440+Tool bar height:C1016
	var $winRef:=Open window:C153(1; $offset; $width+1; $height+$offset; -Plain dialog box:K34:4)
	DIALOG:C40($form)
	CLOSE WINDOW:C154
	
End if 