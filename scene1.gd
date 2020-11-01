extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")
var tile_roof = load("res://tiles/tile_roof.tres")
var ak_duck = load("res://actors/ak_duck.tscn")

var rng = RandomNumberGenerator.new()

var player : TileActor
var g : TileGrid

var tickTimer = 0

var actorIndex = 0

func _ready():
	
	randomize()
	
	generate()
	
	player = TileActor.new()
	player.texture = load("res://textures/chest.png")
	player.setup(6,6,g)
	add_child(player)
	player.action = PlayerMove.new();
	g.actors.append(player)
	
	for x in range(20):
		var duck = ak_duck.instance()
		add_child(duck)
		duck.setup(6,6,g)
		g.actors.append(duck)


func generate():
	var holder = $TileHolder

	for child in holder.get_children():
		child.free()
	
	g = TileGrid.new(30,25)
	Generators.maze(g, tile_floor, tile_roof)
	g.shortWall(tile_roof, tile_wall)
	spawnSprites()
	

func _process(delta):

		
	if Input.is_key_pressed(KEY_SPACE):
		generate()
	
	tickTimer += delta
	if tickTimer > 0.01:
		var a:TileActor = g.actors[actorIndex]
		if a.getAction().run(a):
			actorIndex = (actorIndex + 1) % g.actors.size()
	
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
