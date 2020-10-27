extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")


var rng = RandomNumberGenerator.new()


var g : TileGrid

func _init():
	g = TileGrid.new(10,10)
	
	for pos in g.positions():
		spawnSprite(pos, g.getTile(pos.x, pos.y))
	
	
func spawnSprite(pos, tile:Tile):
	var node = Sprite.new()
	node.set_name("node")
	
	g.setTile(pos.x, pos.y, tile_wall if g.isEdge(pos.x, pos.y) else tile_floor)
	node.texture = g.getTile(pos.x, pos.y).texture
	
	node.position = Vector2(pos.x*16, pos.y*16)
	add_child(node)
