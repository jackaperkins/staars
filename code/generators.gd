class_name Generators

static func maze (grid:TileGrid, floor_tile:Tile, wall_tile:Tile):
	var columns:int = grid.columns
	var rows:int = grid.rows
	
	var start = {x=3,y=3}
	var current = start.duplicate()
	
	grid.fill(wall_tile)
	
	var maxTries = 99
	grid.setTile(current.x, current.y, floor_tile)
		
	while(true):
		maxTries -= 1
		if maxTries <= 0:
			break
			
		var dir = randomDirection()
		for i in range(3):
			var nextPos = {x=current.x+dir.x, y=current.y+dir.y}
			
			if grid.getTile(nextPos.x, nextPos.y) == floor_tile:
				break
			
			if grid.isEdge(nextPos.x, nextPos.y):
				break
				
			if grid.matchNeighbors(nextPos.x, nextPos.y, floor_tile) < 3:
				if grid.matchNeighborsFour(nextPos.x, nextPos.y, floor_tile) < 2:
					current = nextPos
					grid.setTile(current.x, current.y, floor_tile)
	print("making maze")


static func randomDirection ():
	var directions = [
		{x=-1, y=0},
		{x=1, y=0},
		{x=0, y=1},
		{x=0, y=-1},
	]
	return directions[randi() % directions.size()]
