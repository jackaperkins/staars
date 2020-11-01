extends Action

class_name PlayerMove


func run (player) -> bool:
	if Input.is_action_just_pressed("east"):
		player.tryMove(1,0)
		return true
	if Input.is_action_just_pressed("west"):
		player.tryMove(-1,0)
		return true
	if Input.is_action_just_pressed("north"):
		player.tryMove(0,-1)
		return true
	if Input.is_action_just_pressed("south"):
		player.tryMove(0,1)
		return true
	
	return false
