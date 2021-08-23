//%attributes = {}
var $quickOpen : Boolean

// Only in development mode
If (Not:C34(Is compiled mode:C492(*)))
	
	// Only if the component is loaded
	ARRAY TEXT:C222($components; 0)
	COMPONENT LIST:C1001($components)
	
	If (Find in array:C230($components; "4DPop QuickOpen")>0)
		
		// Is it a quickOpen call?
		EXECUTE METHOD:C1007("quickOpenEventHandler"; $quickOpen)
		
	End if 
End if 

If (Not:C34($quickOpen))
	
	// <THE DATABASE EVENT HANDLER CODE>
	
End if 