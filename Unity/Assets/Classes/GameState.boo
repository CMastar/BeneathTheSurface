import UnityEngine

class GameState (MonoBehaviour):
	victory as bool = false
	defeat as bool = false
	public boxW as int = 400
	public boxH as int = 300

	def Start ():
		pass
	
	def Update ():
		pass
		
	public def AndroidCaptured(android as GameObject):
		victory = true
		
	public def AndroidEscaped(android as GameObject):
		defeat = true
		
	def OnGUI():
		text as string
		if victory:
			text = "You have captured the dangerous Android. Congratulations"
		if defeat:
			text = "The dangerous Android has escaped. Let the consequences fall on your head"
		if victory or defeat:
			GUI.BeginGroup(Rect((Screen.width - boxW)/2, (Screen.height - boxH)/2,boxW,boxH))
			GUI.Box(Rect(0,0,boxW,boxH),"Mission Over")
			GUI.Label(Rect(10,40,boxW - 20,40),text)
			if GUI.Button(Rect(10,boxH - 60,boxW - 20,50),"Restart Level"):
				Application.LoadLevel("StreetTest")
			GUI.EndGroup()
			
	public def MakeAndroid():
		robotified = false
		chars = GameObject.FindGameObjectsWithTag("Characters")
		while not robotified:
			rand = Random.Range(0,len(chars) - 1)
			npc as NPC = chars[rand].GetComponent[of NPC]()
			unless npc == null:
				npc.isAndroid = true
				chars[rand].AddComponent(Android)
				robotified = true
		Debug.Log(chars[rand].name + " is the android")
			
		
