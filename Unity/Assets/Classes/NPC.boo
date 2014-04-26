import UnityEngine

class NPC (MonoBehaviour): 
	public minForce as single
	public maxForce as single
	public timeToDodge as double
	actualForce as single
	direction as Quaternion
	sideStepTime as double = 0
	directionVector as Vector3 = Vector3.forward
	aimingFor as GameObject
	
	def Start ():
		actualForce = Random.Range(minForce,maxForce)
		RandomWaypoint()
		
	
	def FixedUpdate ():
		if sideStepTime > 0:
			sideStepTime = sideStepTime - Time.fixedDeltaTime
			renderer.material.color = Color.green
		else:
			if sideStepTime <= 0 and sideStepTime != -1:
				sideStepTime = -1
				if CheckWaypoint(aimingFor):
					direction = Quaternion.LookRotation(aimingFor.collider.ClosestPointOnBounds(transform.position) - transform.position)
				else:
					RandomWaypoint()
			directionVector = Vector3.forward
			renderer.material.color = Color.white
		rigidbody.AddForce(direction  /* transform.rotation */ * directionVector  * actualForce * Time.fixedDeltaTime, ForceMode.VelocityChange)

	
	def PickDirection() as Quaternion:
		// return Quaternion.Euler(0,Random.Range(0,360),0)

		
		//transform.LookAt(waypoint.transform)
		return 
	
	def CheckWaypoint(waypointToCheck as GameObject) as bool:
		if waypointToCheck == null:
			Debug.Log("Waypoint is null for " + name)
			return false
		if Vector3.Distance(waypointToCheck.transform.position, transform.position) < 5:
			Debug.Log(waypointToCheck.name + " is too close to " + name)
			return false
		obstacles = Physics.RaycastAll(transform.position,Quaternion.LookRotation(waypointToCheck.transform.position - transform.position) * Vector3.forward  , Vector3.Distance(transform.position, waypointToCheck.transform.position) )
		// Debug.Log(len(obstacles).ToString() + " obstacles for " + name)
		for hit as RaycastHit in obstacles:
			if hit.collider.tag == "Terrain":
				Debug.Log(hit.collider.name + " is in the way of " + name)
				return false
		return true
		
		
	def OnCollisionEnter():
		//direction = PickDirection()
		pass
		
	def OnCollisionStay():
		if sideStepTime <= 0:
			sideStepTime = timeToDodge
			dodgeDirections = (Vector3.left,Vector3.back, Vector3.right)
			directionVector = dodgeDirections[Random.Range(0,3)]
			
	public def SetWaypoint(waypoint as GameObject):
		aimingFor = waypoint
		direction = Quaternion.LookRotation(waypoint.collider.ClosestPointOnBounds(transform.position) - transform.position)
		// Debug.Log(name + " is heading for " + waypoint.name)
			
	public def RandomWaypoint():
		valid = false
		i = 0
		waypoints as (GameObject)
		waypoints = GameObject.FindGameObjectsWithTag("Waypoints")
		while valid == false:
			waypoint = waypoints[Random.Range(0,len(waypoints))]
			valid = CheckWaypoint(waypoint)
			i = i + 1
			if i > len(waypoints) * 3:
				Debug.Log(name + " cannot find a valid waypoint after" + i + "attempts")
				actualForce = 0
				renderer.material.color = Color.red
				valid = true
		// Debug.Log(i + "attempts to find point needed")
		SetWaypoint(waypoint)