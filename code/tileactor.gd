extends Sprite

class_name TileActor

var x:int
var y:int
var parentGrid:TileGrid

func _init(xx:int, yy:int, grid:TileGrid):
	x = xx
	y = yy
	parentGrid = grid
	
func tryMove(deltaX:int, deltaY:int):
	if(parentGrid.isPassable(x+deltaX, y+deltaY)):
		x = x+deltaX
		y = y+deltaY

func _process(delta):
	if position != Vector2(x*16, y*16):

		position = position.move_toward(Vector2(x*16, y*16), 4)
