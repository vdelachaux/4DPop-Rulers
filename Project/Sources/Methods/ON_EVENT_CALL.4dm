//%attributes = {}
var $caught : Boolean

// Only if the component is loaded
ARRAY TEXT:C222($components; 0)
COMPONENT LIST:C1001($components)

If (Find in array:C230($components; "4DPop QuickOpen")>0)
	
	If (MODIFIERS ?? Option key bit:K16:8)  // ⌥
		
		If (KEYCODE=202)  // Space
			
			// Only for the design process
			var $t : Text
			var $i : Integer
			PROCESS PROPERTIES:C336(Frontmost process:C327(*); $t; $i; $i; $i; $i; $i)
			
			$caught:=($i=Design process:K36:9)
			
		End if 
	End if 
End if 

If ($caught)
	
	FILTER EVENT:C321
	EXECUTE METHOD:C1007("QUICK_OPEN")
	
Else 
	
	// <THE DATABASE EVENT HANDLER CODE, IF ANY>
	
End if 