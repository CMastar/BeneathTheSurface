import UnityEngine

class Net (MonoBehaviour):

	public range as single
	public expansionTime as single
	public tracker as GameObject
	fireTime as single

	def Start ():
		fireTime = Time.time
		Debug.Log("Net launched!")
	
	def Update ():
		if Time.time < fireTime + expansionTime:
			gameObject.GetComponent[of BoxCollider]().center.z = Mathf.Lerp(0,range,(Time.time - fireTime) / expansionTime)
			tracker.transform.localPosition.z = Mathf.Lerp(0,range,(Time.time - fireTime) / expansionTime)


		
	def OnTriggerEnter(hit as Collider):
		if Time.time < fireTime + expansionTime:
#			Debug.Log("Net hit " + hit.collider.name)
			NPCHit as NPC = hit.GetComponent[of NPC]()
			unless NPCHit == null:
				NPCHit.Trap()
				GameObject.Destroy(gameObject)
		else:
			netGun as NetGun = hit.GetComponentInChildren[of NetGun]()
			unless netGun == null:
				if netGun.Reload():
					GameObject.Destroy(gameObject)
		