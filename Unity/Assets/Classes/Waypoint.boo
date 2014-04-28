import UnityEngine

class Waypoint (MonoBehaviour): 

	def Start ():
		pass
	
	def Update ():
		pass
		
	def OnTriggerEnter(collided as Collider):
		// Debug.Log(collided.name + " entered " + name)
		npc = collided.gameObject.GetComponent[of NPC]()
		unless npc == null:
			npc.RandomWaypoint()
