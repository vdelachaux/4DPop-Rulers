//%attributes = {"invisible":true}
// ----------------------------------------------------
// Method : DeleteGuidelines
// Created 16/05/07 by Vincent de Lachaux
// ----------------------------------------------------
C_LONGINT:C283($Lon_i; $Lon_Statut; $Lon_Time)
C_TEXT:C284($Txt_Name)

For ($Lon_i; 1; Count tasks:C335; 1)
	PROCESS PROPERTIES:C336($Lon_i; $Txt_Name; $Lon_Statut; $Lon_Time)
	If ($Txt_Name="$4DPop_Splitter@")
		POST OUTSIDE CALL:C329($Lon_i)
	End if 
End for 