import UnityEngine

class RandomBodyAssembler (MonoBehaviour):
	public heads as (GameObject)
	public torsos as (GameObject)
	public legs as (GameObject)
	
	headPos = Vector3(0,0,0)
	torsoPos = Vector3(0,0,0)
	legPos = Vector3(0,0,0)
	

	def Start ():
		PlaceBodyPart(heads[Random.Range(0,len(heads))],headPos)
		PlaceBodyPart(torsos[Random.Range(0,len(torsos))],torsoPos)
		PlaceBodyPart(legs[Random.Range(0,len(legs))],legPos)
	
	def Update ():
		pass

	def PlaceBodyPart(bodyPart as GameObject, localLocation as Vector3):
		part as GameObject = GameObject.Instantiate(bodyPart,Vector3.zero,transform.rotation)
		part.transform.parent = transform
		part.transform.localPosition = localLocation