import UnityEngine

class Android (MonoBehaviour):
	public EscapePoint as GameObject

	def Start ():
		EscapePoint = GameObject.FindGameObjectWithTag("Escape")
	
	def Update ():
		pass
		
	def Detected():
		npc as NPC = gameObject.GetComponent[of NPC]()
		npc.SetWaypoint(EscapePoint)
		npc.Run(0)
