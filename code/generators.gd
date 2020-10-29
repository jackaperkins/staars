class_name Generators

static func maze (grid:TileGrid, floor_tile:Tile, wall_tile:Tile, optionalPosition=null):
	var columns:int = grid.columns
	var rows:int = grid.rows
	
	
	var start = {x=3,y=3}
	if optionalPosition != null:
		start = optionalPosition
	
	var current = start.duplicate()
	
	grid.fill(wall_tile)
	
	grid.setDiamond(8,10,8,floor_tile)
	grid.setDiamond(14,10,8,floor_tile)
	grid.setDiamond(20,10,8,floor_tile)
	
	grid.setDiamond(5,10,3,wall_tile)
	grid.setDiamond(14,10,5,wall_tile)
	grid.setDiamond(23,10,3,wall_tile)
	
	return
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
