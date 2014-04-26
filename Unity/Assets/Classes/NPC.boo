import UnityEngine

class NPC (MonoBehaviour): 
	public moveForce as single
	direction as Quaternion
	
	def Start ():
		direction = PickDirection()
	
	def FixedUpdate ():

		rigidbody.AddForce(direction * Vector3.forward * moveForce * Time.fixedDeltaTime, ForceMode.VelocityChange)

	
	def PickDirection() as Quaternion:
		return Quaternion.Euler(0,Random.Range(0,360),0)
		
	def OnCollisionEnter():
		direction = PickDirection()
