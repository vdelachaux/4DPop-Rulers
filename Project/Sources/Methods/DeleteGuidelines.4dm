//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : DeleteGuidelines
// Created 16/05/07 by Vincent de Lachaux
// ----------------------------------------------------
var $p : Integer
For ($p; 1; Count tasks:C335; 1)
	
	If (Process info:C1843($p).name="$4DPop_Splitter@")
		
		POST OUTSIDE CALL:C329($p)
		
	End if 
End for 