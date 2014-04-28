import UnityEngine

class NetRelease (PlayerItem):
	readyTime as single = 0
	public coolDown as single
	public range as single

	def Use(direction as Vector3):
		if Time.time > readyTime:
			readyTime = Time.time + coolDown
			rayInfo as RaycastHit
			if Physics.SphereCast(transform.position,0.5, direction, rayInfo, range):
				Debug.Log("Netgun Release found: " + rayInfo.collider.name)
				npc as NPC = rayInfo.collider.GetComponent[of NPC]()
				unless npc == null:
					if npc.Release():
						netgun = transform.parent.gameObject.GetComponentInChildren[of NetGun]()
						unless netgun == null:
							netgun.Reload()
						
