import UnityEngine

class SpriteAnimationController (MonoBehaviour): 
	currentAnimation as SpriteAnimation

	def Start ():
		pass
			
	
	def Update ():
		pass
		
	public def PlayAnimation(animationName as string) as bool:
		unless currentAnimation == null:
			unless currentAnimation.AnimName == animationName: // Don't want to cause weird stop-start of existin animations
				currentAnimation.StopAnimation()
		if CheckAnimationName(animationName): // Don't want to cause weird stop-start of existing animations
			for anim as SpriteAnimation in gameObject.GetComponentsInChildren[of SpriteAnimation]():
				if anim.AnimName == animationName:
					currentAnimation = anim
					currentAnimation.StartAnimation()
					return true
			// Debug.Log("Could not find animation " + animationName)
			return false
		
		
	def CheckAnimationName(animationName) as bool:
		if currentAnimation == null:
			return true
		else:
			if currentAnimation.AnimName == animationName:
				return false
			else:
				return true
			
	public def PlayAnimation(animationName as string, framerate as double) as bool:
		flag = PlayAnimation(animationName)
		unless currentAnimation == null:
			currentAnimation.SetFrameRate(framerate)
		return flag
