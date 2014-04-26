import UnityEngine



class PlayerMove (MonoBehaviour): 

	public moveForce as single
	public forceMove as bool
	
	def Start ():
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
