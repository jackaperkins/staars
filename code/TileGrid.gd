extends Grid

class_name TileGrid


func _init(x:int, y:int).(x,y):
	pass

func passable(x:int, y:int):
	if not isSafe(x,y):
		return false
	if tiles[x][y] == null:
		return false
	
	return tiles[x][y].passable
