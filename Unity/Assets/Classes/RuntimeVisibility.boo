import UnityEngine

class RuntimeVisibility (MonoBehaviour): 
	
	public VisibleAtRuntime as bool = false

	def Start ():
		renderer.enabled = VisibleAtRuntime
	
	def Update ():
		pass
