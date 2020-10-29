extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")



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
	
	g = TileGrid.new(25,20)
	Generators.maze(g, tile_floor, tile_wall)
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
		if g.getTile(pos.x, pos.y) != null:
			node.texture = g.getTile(pos.x, pos.y).texture
			node.position = Vector2(pos.x*16, pos.y*16)
			holder.add_child(node)
