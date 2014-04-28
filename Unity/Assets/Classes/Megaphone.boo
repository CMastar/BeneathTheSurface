import UnityEngine

class Megaphone (PlayerItem):
	public range as single
	public cooldown as single
	public scareTime as single
	timeAvailable as single = 0

	def Start ():
		pass
	
	def Use (direction as Vector3):
		if Time.time > timeAvailable:
			timeAvailable = Time.time + cooldown
			audio.Play()
			i = 0
			for col in Physics.OverlapSphere(transform.position,range):
				npc = col.GetComponent[of NPC]()
				unless npc == null:
					npc.RunFrom(transform.position, scareTime)
					i = i + 1
			Debug.Log("Megaphone scared $i NPCs")
