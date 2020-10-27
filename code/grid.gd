extends Reference

class_name Grid

var columns :int
var rows : int

var tiles
func _init( xx:int,  yy:int):
	columns = xx
	rows = yy
	tiles = construct_array(columns,rows)

func setTile(x:int, y:int, value):
	if not isSafe(x,y):
		pass
	tiles[x][y] = value
	
func getTile(x:int, y:int):
	if not isSafe(x,y):
		return null
	return tiles[x][y] 

func isEdge (x:int, y:int) -> bool:
	if x == 0 || y == 0:
		return true
	
	if x == columns-1 || y == rows-1:
		return true
	
	return false
	
func isSafe(x:int, y:int) -> bool:
	if x >= 0 and x < columns and y >= 0 and y < rows:
		return true;
	return false;

func positions ():
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
	
