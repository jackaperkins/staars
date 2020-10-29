extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")
var tile_roof = load("res://tiles/tile_roof.tres")


var rng = RandomNumberGenerator.new()

var player : TileActor
var g : TileGrid

func _ready():
	
	randomize()
	
	generate()
	
	player = TileActor.new(3,3,g)
	player.texture = load("res://textures/chest.png")
	add_child(player)

func generate():
	var holder = $TileHolder

	for child in holder.get_children():
		child.free()
	
	g = TileGrid.new(30,25)
	Generators.maze(g, tile_floor, tile_roof)
	g.shortWall(tile_roof, tile_wall)
	spawnSprites()
	

func _process(delta):
	if Input.is_action_just_pressed("east"):
		player.tryMove(1,0)
	if Input.is_action_just_pressed("west"):
		player.tryMove(-1,0)
	if Input.is_action_just_pressed("north"):
		player.tryMove(0,-1)
	if Input.is_action_just_pressed("south"):
		player.tryMove(0,1)
		
	if Input.is_key_pressed(KEY_SPACE):
		generate()
		
	
func spawnSprites():
	var holder = get_node("TileHolder")
	for pos in g.positions():
		var node = Sprite.new()
		var tile = g.getTile(pos.x, pos.y) 
		if tile != null:
			var textures = [tile.texture]
			if tile.alternativeTextures != null:
				textures += tile.alternativeTextures 
			
			node.texture = textures[(pos.x+pos.y) % textures.size()]
			node.position = Vector2(pos.x*16, pos.y*16)
			holder.add_child(node)
