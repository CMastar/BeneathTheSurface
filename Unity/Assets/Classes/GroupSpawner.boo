import UnityEngine

class GroupSpawner (MonoBehaviour):
	public thingToSpawn as GameObject
	public numberToSpawn as int
	public spawnRadius as single
	public spawnOnLevelStart as bool
	public NameGiven as string

	def Start ():
		if spawnOnLevelStart:
			SpawnMass(numberToSpawn)
	
	def Update ():
		pass

	public def SpawnMass(spawnNumber as long):
		for i in range(spawnNumber):
			spawnPos = Random.insideUnitCircle * spawnRadius
			spawned = GameObject.Instantiate(thingToSpawn,Vector3(transform.position.x + spawnPos.x,transform.position.y,transform.position.z + spawnPos.y),Quaternion.identity)
			spawned.name = spawned.name[0:-7] + NameGiven + i