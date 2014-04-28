

class AndroidDetector (PlayerItem):
	
	public coolDown as single
	public detectorRange as single
	readyTime as single = 0
	
	public def Use(direction as Vector3):
		if Time.time > readyTime:
			readyTime = Time.time + coolDown
			rayInfo as RaycastHit
			if Physics.Raycast(transform.position, direction, rayInfo, detectorRange):
				Debug.Log("Adroid Detector found: " + rayInfo.collider.name)
				npc as NPC = rayInfo.collider.GetComponent[of NPC]()
				unless npc == null:
					npc.Detect()
			
		

	
