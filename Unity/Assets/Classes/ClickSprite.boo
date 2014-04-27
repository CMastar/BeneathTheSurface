import UnityEngine

class ClickSprite (MonoBehaviour): 
	public ren as SpriteRenderer
	public otherSprite as Sprite

	def Start ():
		pass
	
	def Update ():
		if Input.GetButton('Fire1'):
			ren.sprite = otherSprite
