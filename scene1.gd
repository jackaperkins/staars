extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")


var rng = RandomNumberGenerator.new()

var player : TileActor
var g : TileGrid

func _init():
	
	
	g = TileGrid.new(25,20)
	
#	for pos in g.positions():
#		spawnSprite(pos, g.getTile(pos.x, pos.y))
		
	g.setRect(14,3,6,7, tile_floor)
	g.setRect(3,3,6,4, tile_floor)
	g.setRect(3,10,7,8, tile_floor)
	
	g.setRect(5,5,1,10, tile_floor)
	g.setRect(5,6,10,1, tile_floor)
	
	g.wrapTile(tile_floor, tile_wall)
	
	spawnSprites()
	
	player = TileActor.new(3,3,g)
	player.texture = load("res://textures/chest.png")
	add_child(player)
	

func _process(delta):
	if Input.is_action_just_pressed("right"):
		player.tryMove(1,0)
	if Input.is_action_just_pressed("left"):
		player.tryMove(-1,0)
	if Input.is_action_just_pressed("up"):
		player.tryMove(0,-1)
	if Input.is_action_just_pressed("down"):
		player.tryMove(0,1)
		
	
func spawnSprites():
	for pos in g.positions():
		var node = Sprite.new()
		if g.getTile(pos.x, pos.y) != null:
			node.texture = g.getTile(pos.x, pos.y).texture
			node.position = Vector2(pos.x*16, pos.y*16)
			add_child(node)
