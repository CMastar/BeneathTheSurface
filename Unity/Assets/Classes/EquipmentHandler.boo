import UnityEngine

class EquipmentHandler (MonoBehaviour):
	
	public equipedItem as GameObject
	equipedItemObject as PlayerItem
	direction as Quaternion

	def Start ():
		equipedItemObject = equipedItem.GetComponent[of PlayerItem]()
	
	def Update ():
		unless Input.GetAxis('Horizontal') == 0 and Input.GetAxis('Vertical') == 0:
			dir = Quaternion.LookRotation(Vector3(Input.GetAxis('Horizontal'),0,Input.GetAxis('Vertical')),Vector3.up)
			
		if Input.GetButton("UseItem"):
			equipedItemObject.Use(Vector3.left)
	
	def OnGUI():
		unless equipedItemObject == null:
			GUI.Label(Rect(10,10,200,10),"Equipped Item: " + equipedItemObject.itemName)
			
			
