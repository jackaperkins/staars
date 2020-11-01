extends Sprite

class_name TileActor

export var x:int
export var y:int
var parentGrid:TileGrid

var action:Action

func setup(xx:int, yy:int, grid:TileGrid):
	x = xx
	y = yy
	position = Vector2(x*16, y*16)
	parentGrid = grid

func getAction() -> Action:
	if action != null:
		return action
	return RandomMove.new()

func moveRandomly():
	var directions = parentGrid.neighborPositionsFour()
	var attempt = directions[randi()%directions.size()]
	if parentGrid.isPassable(attempt.x + x, attempt.y + y, true):
		x += attempt.x
		y += attempt.y
	
func tryMove(deltaX:int, deltaY:int):
	if(parentGrid.isPassable(x+deltaX, y+deltaY)):
		x = x+deltaX
		y = y+deltaY

func _process(delta):
	if position != Vector2(x*16, y*16):

		position = position.move_toward(Vector2(x*16, y*16), 4)
