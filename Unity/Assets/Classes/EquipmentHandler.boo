import UnityEngine

class EquipmentHandler (MonoBehaviour):
	
	public equipedItem as GameObject
	equipedItemObject as PlayerItem
	direction as Quaternion
	items as (PlayerItem)
	selectedIndex as int

	def Start ():
		equipedItemObject = equipedItem.GetComponent[of PlayerItem]()
		items = gameObject.GetComponentsInChildren[of PlayerItem]()
	
	def Update ():
		unless Input.GetAxis('Horizontal') == 0 and Input.GetAxis('Vertical') == 0:
			dir = Quaternion.LookRotation(Vector3(Input.GetAxis('Horizontal'),0,Input.GetAxis('Vertical')),Vector3.up)
			
		if Input.GetButton("UseItem"):
			equipedItemObject.Use(Vector3.left)
	
	def OnGUI():
		unless items == null:
			grid = array(GUIContent, len(items))
			for i in range(len(items)):
				grid[i] = GUIContent(items[i].itemName,items[i].icon)
			selectedIndex = GUI.SelectionGrid(Rect(10,10,500,80),selectedIndex, grid,len(grid))
			equipedItemObject = items[selectedIndex]
			
			
