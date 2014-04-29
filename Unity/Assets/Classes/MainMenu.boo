import UnityEngine

class MainMenu (MonoBehaviour): 
	public menuW as int = 400
	public menuH as int = 400
	showInstructions as bool = false
	public instructionText as TextAsset
	
	def OnGUI():
		GUI.BeginGroup(Rect((Screen.width - menuW) / 2,200,menuW,menuH))
		if showInstructions:
			GUI.Box(Rect(0,0,menuW,menuH - 60),"")
			GUI.Label(Rect(0,0,menuW,menuH - 60),instructionText.text)
			if GUI.Button(Rect(0,menuH - 50,menuW,50),"Back to menu"):
				showInstructions = false
		else:
			if GUI.Button(Rect(0,0,menuW,50),"Start Game"):
				Application.LoadLevel("level1")
			if GUI.Button(Rect(0,60,menuW,50),"Instructions"):
				showInstructions = true
			if Application.isWebPlayer:
				if GUI.Button(Rect(0,120,menuW,50),"Visit Our Website \n Download the Game"):
					Application.OpenURL("http://games.linxsoft.co.uk")
			else:
				if GUI.Button(Rect(0,120,menuW,50),"Quit"):
					Application.Quit()
		GUI.EndGroup()
