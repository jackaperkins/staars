extends Reference

class_name Grid

var columns :int
var rows : int

var tiles

var rng = RandomNumberGenerator.new()

func _init( xx:int,  yy:int):
	columns = xx
	rows = yy
	tiles = construct_array(columns,rows)
	
	for coord in coordinates():
		print(str(coord.x, ' ', coord.y))
		
	for x in range(columns):
		for y in range(rows):
			tiles[x][y] = 0
			if rng.randi_range(0,10) > 5:
				tiles[x][y] = 5
			# print(tiles[x][y])

func isEdge (x:int, y:int) -> bool:
	if x == 0 || y == 0:
		return true
	
	if x == columns-1 || y == rows-1:
		return true
	
	return false

func coordinates ():
	var output = []
	for x in range(columns):
		for y in range(rows):
			output.push_back({x=x,y=y})
	return output
	
func construct_array(width:int, height:int):
	var a = []

	for x in range(width):
	    a.append([])
	    a[x].resize(height)
	
	    for y in range(height):
	    	a[x][y] = null
	
	return a
	