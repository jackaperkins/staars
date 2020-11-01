extends Grid

class_name TileGrid

var actors = []

func _init(x:int, y:int).(x,y):
	pass

func isPassable(x:int, y:int, check_actors=false):
	if not isSafe(x,y):
		return false
	if tiles[x][y] == null:
		return false
	
	if check_actors:
		for a in actors:
			if a.x == x and a.y == y:
				return false
	
	return tiles[x][y].passable

