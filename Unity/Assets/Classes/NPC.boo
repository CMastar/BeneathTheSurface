import UnityEngine

class NPC (MonoBehaviour): 
	public moveForce as single
	direction as Quaternion
	
	def Start ():
		direction = PickDirection()
	
	def FixedUpdate ():

		rigidbody.AddForce(direction * Vector3.forward * moveForce * Time.fixedDeltaTime, ForceMode.VelocityChange)

	
	def PickDirection() as Quaternion:
		// return Quaternion.Euler(0,Random.Range(0,360),0)
		waypoints as (GameObject)
		waypoints = GameObject.FindGameObjectsWithTag("Waypoints")
		waypoint = waypoints[Random.Range(0,len(waypoints) - 1)]
		print "Picked waypoint " + waypoint.name
		return Quaternion.LookRotation(Vector3.MoveTowards(transform.position, waypoint.transform.position, 100))
		
		
	def OnCollisionEnter():
		direction = PickDirection()
