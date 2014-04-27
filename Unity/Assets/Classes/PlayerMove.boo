import UnityEngine



class PlayerMove (MonoBehaviour): 

	public moveForce as single
	public forceMove as bool
	public animController as SpriteAnimationController
	
	def Start ():
		pass
		
	def Update():
		pass
			
	def FixedUpdate ():
		if Input.GetButton('Sprint'):
			forceToUse = moveForce * 2
		else:
			forceToUse = moveForce
		if forceMove:
			rigidbody.AddForce(forceToUse * Input.GetAxis('Horizontal') * Time.fixedDeltaTime,0,forceToUse * Input.GetAxis('Vertical') * Time.fixedDeltaTime, ForceMode.VelocityChange)
		else:
			rigidbody.MovePosition(transform.position + Vector3.forward * forceToUse * Time.fixedDeltaTime * Input.GetAxis('Vertical') + Vector3.right * forceToUse * Time.fixedDeltaTime * Input.GetAxis('Horizontal'))
		
		 fR = (Mathf.Abs(rigidbody.velocity.x) / 5) * 10
		//Debug.Log((Mathf.Abs(rigidbody.velocity.x).ToString()))
		//fR = 10
		if rigidbody.velocity.x > 0:
			animController.PlayAnimation("WalkingRight",fR)
		else:
			animController.PlayAnimation("WalkingLeft",fR)	
		
