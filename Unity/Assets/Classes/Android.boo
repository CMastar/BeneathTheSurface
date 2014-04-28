import UnityEngine

class Android (MonoBehaviour):

		
	def FindEscapePoint(npc as NPC) as GameObject:
		for esc as GameObject in GameObject.FindGameObjectsWithTag("Escape"):
			if Vector3.Distance(transform.position,esc.transform.position) > 20:
				if npc.CheckWaypoint(esc):
					return esc
	
	public def Detected():
		npc as NPC = gameObject.GetComponent[of NPC]()
		npc.SetWaypoint(FindEscapePoint(npc))
		npc.escaping = true
		npc.Run(0)
