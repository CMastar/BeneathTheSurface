import UnityEngine

class EquipmentHandler (MonoBehaviour):
	
	public equipedItem as GameObject
	equipedItemObject as PlayerItem
	direction as Quaternion
	items as (PlayerItem)
	selectedIndex as int
	dir as Vector3

	def Start ():
		equipedItemObject = equipedItem.GetComponent[of PlayerItem]()
		items = gameObject.GetComponentsInChildren[of PlayerItem]()
		
	def OrientateItems(angle as single):
		for item in items:
			item.transform.rotation = Quaternion.Euler(0,angle,0)

	
	def Update ():

		
			
		
		horz = Input.GetAxis('Horizontal')
		vert = Input.GetAxis('Vertical')
		if horz > 0:
			OrientateItems(0)
		else:
			if horz < 0:
				OrientateItems(180)
			
		if Input.GetButton("UseItem"):
			unless horz == 0 and  vert == 0:
				if Mathf.Abs(horz) > Mathf.Abs(vert):
					if horz > 0:
						dir = Vector3.right
					else:
						dir = Vector3.left
				else:
					if vert > 0:
						dir = Vector3.forward
					else:
						dir = Vector3.back

			equipedItemObject.Use(dir)
	
	def OnGUI():
		GUI.skin.button.imagePosition = ImagePosition.ImageAbove
		unless items == null:
			grid = array(GUIContent, len(items))
			for i in range(len(items)):
				grid[i] = GUIContent(items[i].itemName,items[i].icon)
			selectedIndex = GUI.SelectionGrid(Rect(10,10,500,80),selectedIndex, grid,len(grid))
			equipedItemObject = items[selectedIndex]
			equipedItem.renderer.enabled = false
			equipedItem = equipedItemObject.gameObject
			equipedItem.renderer.enabled = true
			
			
