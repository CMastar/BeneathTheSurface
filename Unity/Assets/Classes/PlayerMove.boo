import UnityEngine



class PlayerMove (MonoBehaviour): 

	public MoveForce as single
	
	def Start ():
		pass
	
	def FixedUpdate ():
		rigidbody.AddForce(MoveForce * Input.GetAxis('Horizontal') * Time.fixedDeltaTime,0,MoveForce * Input.GetAxis('Vertical') * Time.fixedDeltaTime, ForceMode.VelocityChange)
