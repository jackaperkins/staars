extends Sprite

class_name TileActor

var x:int
var y:int
var parentGrid:TileGrid

func _init(xx:int, yy:int, grid:TileGrid):
	x = xx
	y = yy
	parentGrid = grid

func _process(delta):
	position = Vector2(x*16, y*16)
