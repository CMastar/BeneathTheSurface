import UnityEngine

class NPC (MonoBehaviour): 
	public isAndroid as bool = false
	public minForce as single
	public maxForce as single
	public timeToDodge as double
	actualForce as single
	direction as Quaternion
	sideStepTime as double = 0
	directionVector as Vector3 = Vector3.forward
	aimingFor as GameObject
	setAnim as bool = false
	stopRunning as single
	public bodyPartAnimations as (SpriteAnimationController)

	
	def Start ():
		actualForce = Random.Range(minForce,maxForce)
		RandomWaypoint()
		renderer.enabled = false
		// animCont = gameObject.GetComponent[of SpriteAnimationController]()
		
	
	def FixedUpdate ():
		setAnim = false
		if actualForce > maxForce and Time.time > stopRunning:
			actualForce = Random.Range(minForce,maxForce)
			direction = GetDirection()
		if sideStepTime > 0:
			sideStepTime = sideStepTime - Time.fixedDeltaTime
			// renderer.material.color = Color.green
			//WalkingAnimation()
		else:
			if sideStepTime <= 0 and sideStepTime != -1:
				setAnim = true
				sideStepTime = -1
				if CheckWaypoint(aimingFor):
					direction = GetDirection()
				else:
					RandomWaypoint()
			directionVector = Vector3.forward
			// renderer.material.color = Color.white
		rigidbody.AddForce(direction * directionVector  * actualForce * Time.fixedDeltaTime, ForceMode.VelocityChange)
		//if setAnim:
		WalkingAnimation()
		
	def GetDirection() as Quaternion:
		setAnim = true
		return Quaternion.LookRotation(aimingFor.collider.ClosestPointOnBounds(transform.position) - transform.position)
	
	def WalkingAnimation():
		if bodyPartAnimations == null or len(bodyPartAnimations) == 0:
			bodyPartAnimations = gameObject.GetComponentsInChildren[of SpriteAnimationController]()
		fR = ( actualForce / ( (maxForce + minForce) /2 ) ) * 10
		if rigidbody.velocity.x > 0:
			animName = "WalkingRight"
		else:
			animName = "WalkingLeft"
		for part in bodyPartAnimations:
			part.PlayAnimation(animName,fR)

	
	public def CheckWaypoint(waypointToCheck as GameObject) as bool:
		if waypointToCheck == null:
		//	Debug.Log("Waypoint is null for " + name)
			return false
		if Vector3.Distance(waypointToCheck.transform.position, transform.position) < 5:
		//	Debug.Log(waypointToCheck.name + " is too close to " + name)
			return false
		obstacles = Physics.SphereCastAll(transform.position,0.5,Quaternion.LookRotation(waypointToCheck.transform.position - transform.position) * Vector3.forward  , Vector3.Distance(transform.position, waypointToCheck.transform.position) )
		// Debug.Log(len(obstacles).ToString() + " obstacles for " + name)
		for hit as RaycastHit in obstacles:
			if hit.collider.tag == "Terrain":
		//		Debug.Log(hit.collider.name + " is in the way of " + name)
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
			setAnim = true
			
	public def SetWaypoint(waypoint as GameObject):
		aimingFor = waypoint
		direction = GetDirection()
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
		
	public def Run(timetoRun as single):
		if timetoRun == 0:
			stopRunning = Mathf.Infinity
		else:
			stopRunning = Time.time + timetoRun
		actualForce = 2 * maxForce
		
		
	public def Trap():
		actualForce = 0
		renderer.enabled = true
		if isAndroid:
			GameObject.Find("LevelControl").GetComponent[of GameState]().AndroidCaptured(gameObject)
			
	public def Release() as bool:
		if actualForce == 0:
			renderer.enabled = false
			return true
		else:
			return false
			
	def OnTriggerEnter(trigger as Collider):
		if trigger.tag == "Waypoints":
			RandomWaypoint()
		if trigger.tag == "Escape":
			Escaped()
			
	def Escaped():
		if isAndroid:
			GameObject.Find("LevelControl").GetComponent[of GameState]().AndroidEscaped(gameObject)
			
	public def RunFrom(place as Vector3, time as single):
		direction = Quaternion.Inverse(Quaternion.LookRotation(place - transform.position))
		Run(time)
		
	public def Detect() as bool:
		audio.Play()
		if isAndroid:
			gameObject.GetComponent[of Android]().Detected()
		else:
			Run(0.5)
		return isAndroid