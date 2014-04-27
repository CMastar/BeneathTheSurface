

class AndroidDetector (PlayerItem):
	
	public detectorRange as single
	
	public def Use(direction as Vector3):
		rayInfo as RaycastHit
		if Physics.Raycast(transform.position, direction, rayInfo, detectorRange):
			Debug.Log("Adroid Detector found: " + rayInfo.collider.name)
			npc as NPC = rayInfo.collider.GetComponent[of NPC]()
			unless npc == null:
				npc.Detect()
			
		

	
