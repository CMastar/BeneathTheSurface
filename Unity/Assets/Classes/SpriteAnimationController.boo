import UnityEngine

class SpriteAnimationController (MonoBehaviour): 
	animations as Hash
	currentAnimation as SpriteAnimation

	def Start ():
		animations = Hash()
		for anim as SpriteAnimation in gameObject.GetComponentsInChildren[of SpriteAnimation]():
			animations.Add(anim.AnimName, anim)
			
	
	def Update ():
		pass
		
	public def PlayAnimation(animationName as string) as bool:
		unless currentAnimation == null:
			unless currentAnimation.AnimName == animationName: // Don't want to cause weird stop-start of existin animations
				currentAnimation.StopAnimation()
		if animations[animationName] == null:
			return false
		else:
			unless currentAnimation.AnimName == animationName: // Don't want to cause weird stop-start of existing animations
				currentAnimation = animations[animationName]
				currentAnimation.StartAnimation()
			return true
