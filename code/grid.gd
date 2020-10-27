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
	
func setRect(x1:int, y1:int, x2:int, y2:int, value):
	for i in range(x1, x1+x2):
		for k in range(y1, y1+y2):
			print(str(i, ":", k))
			if not isSafe(i,k):
				continue
			tiles[i][k] = value

func wrapTile(contents, wrapper):
	for x in range(columns):
		for y in range(rows):
			if tiles[x][y] != null:
				continue
			for pos in neighborPositions(x,y):
				if tiles[pos.x][pos.y] == contents:
					setTile(x,y,wrapper)
					break

	
func getTile(x:int, y:int):
	if not isSafe(x,y):
		return null
	return tiles[x][y] 
	
func neighborPositions(x:int, y:int):
	var positions = []
	for i in range(-1,2):
		for k in range(-1,2):
			if i == 0 and k == 0:
				continue
			if isSafe(x+i,y+k):
				positions.push_back({x=(x+i),y=(y+k)})
	return positions

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
	
