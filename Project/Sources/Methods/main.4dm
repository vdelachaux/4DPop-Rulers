//%attributes = {}
#DECLARE($data : Object)

var $form; $name; $task : Text
var $height; $offset; $process; $state; $time; $width : Integer
var $winRef : Integer

$task:="$4DPop_Ruler"

PROCESS PROPERTIES:C336(Current process:C322; $name; $state; $time)

If ($name#$task)
	
	$process:=New process:C317(Current method name:C684; 0; $task; *)
	
Else 
	
	Compiler_Variables
	
	$form:="SCREEN_RULER"
	
	FORM GET PROPERTIES:C674($form; $width; $height)
	$offset:=Menu bar height:C440+Tool bar height:C1016
	$winRef:=Open window:C153(1; $offset; $width+1; $height+$offset; -Plain dialog box:K34:4)
	DIALOG:C40($form)
	CLOSE WINDOW:C154
	
End if 