import UnityEngine

class RandomBodyAssembler (MonoBehaviour):
	public heads as (GameObject)
	public torsos as (GameObject)
	public legs as (GameObject)
	public hitSounds as (AudioClip)
	
	headPos = Vector3(0,1.07,-0.15)
	torsoPos = Vector3(0,0.507,-0.15)
	legPos = Vector3(0,0,-0.15)
	

	def Start ():
		PlaceBodyPart(heads[Random.Range(0,len(heads))],headPos)
		PlaceBodyPart(torsos[Random.Range(0,len(torsos))],torsoPos)
		PlaceBodyPart(legs[Random.Range(0,len(legs))],legPos)
		audio.clip = hitSounds[Random.Range(0,len(hitSounds))]
	
	def Update ():
		pass

	def PlaceBodyPart(bodyPart as GameObject, localLocation as Vector3):
		part as GameObject = GameObject.Instantiate(bodyPart,Vector3.zero,transform.rotation)
		part.transform.parent = transform
		part.transform.localPosition = localLocation