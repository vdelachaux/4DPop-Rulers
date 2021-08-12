//%attributes = {"invisible":true,"shared":true}
// ----------------------------------------------------
// Method : 4DPop_ScreenRuler
// Created 27/11/06 by Vincent de Lachaux
// Alias : zPop_o_dlg_Screen_Ruler from 4DPop 2.0 
// ----------------------------------------------------
C_POINTER:C301($1)

C_LONGINT:C283($Lon_Process; $Lon_Width; $Lon_Height; $Lon_Offset; $Lon_Window; $Lon_State; $Lon_Time)
C_TEXT:C284($Txt_Process; $Txt_Method; $Txt_Form; $Txt_Name)

$Txt_Method:="4DPop_ScreenRuler"
$Txt_Process:="$"+$Txt_Method

PROCESS PROPERTIES:C336(Current process:C322; $Txt_Name; $Lon_State; $Lon_Time)

If ($Txt_Name#$Txt_Process)
	
	$Lon_Process:=New process:C317(Current method name:C684; 0; $Txt_Process; *)
	
Else 
	
	Compiler_Variables
	
	$Txt_Form:="4DPop_ScreenRuler"
	
	FORM GET PROPERTIES:C674($Txt_Form; $Lon_Width; $Lon_Height)
	$Lon_Offset:=Menu bar height:C440+60  //Hauteur barre outils
	$Lon_Window:=Open window:C153(1; $Lon_Offset; $Lon_Width+1; $Lon_Height+$Lon_Offset; -Plain dialog box:K34:4)
	DIALOG:C40($Txt_Form)
	CLOSE WINDOW:C154
	
End if 