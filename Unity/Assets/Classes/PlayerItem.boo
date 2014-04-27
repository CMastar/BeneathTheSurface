import UnityEngine

abstract class PlayerItem (MonoBehaviour):
	public itemName as string

	abstract public def Use(Direction as Vector3):
		pass

	public virtual def GetName() as string:
		return itemName