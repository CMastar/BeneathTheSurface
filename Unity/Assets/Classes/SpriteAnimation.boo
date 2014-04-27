import UnityEngine

class SpriteAnimation (MonoBehaviour):
	public AnimName as string
	public Frames as (Sprite)
	public runningAtSpawn as bool = false
	public frameRate as int
	frameTime as double
	running as bool
	currentFrame as int = 0
	nextFrameTime as double
	spriteRen as SpriteRenderer

	def Start ():
		if runningAtSpawn:
			StartAnimation()
		SetFrameRate(frameRate)
		spriteRen = gameObject.GetComponent[of SpriteRenderer]()
	
	def Update ():
		if running:
			if Time.time > nextFrameTime:
				frameStep as int = 1 + Mathf.FloorToInt((Time.time - nextFrameTime) / frameTime) // Just in case we are in the state of missing frames, makes sure we can handle this
				nextFrameTime = nextFrameTime + frameTime * frameStep
				currentFrame = currentFrame + frameStep
				if currentFrame > (len(Frames) - 1):
					currentFrame = currentFrame - len(Frames)
				spriteRen.sprite = Frames[currentFrame]
					
				
			

	def StartAnimation():
		unless running:
			running = true
			currentFrame = 0
			nextFrameTime = Time.time
		
	def StopAnimation():
		running = false
		
	public def SetFrameRate(fR as double):
		frameTime = 1.0 / fR
		frameRate = fR