import UnityEngine

class EquipmentHandler (MonoBehaviour):
	
	public equipedItem as GameObject
	equipedItemObject as PlayerItem

	def Start ():
		equipedItemObject = equipedItem.GetComponent[of PlayerItem]()
	
	def Update ():
		if Input.GetButton("UseItem"):
			equipedItemObject.Use(Vector3.left)
	
	def OnGUI():
		unless equipedItemObject == null:
			GUI.Label(Rect(10,10,200,10),"Equipped Item: " + equipedItemObject.itemName)
			
