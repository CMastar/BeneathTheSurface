import UnityEngine

class NetGun (PlayerItem): 
	loaded as bool = true
	public netObject as GameObject

	public def Use(direction as Vector3):
		if loaded:
			net as GameObject = GameObject.Instantiate(netObject,transform.position,Quaternion.LookRotation(direction))
			loaded = false
		
	public def Reload() as bool:
		if loaded:
			return false
		else:
			loaded = true
			return true