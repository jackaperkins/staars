extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")


var rng = RandomNumberGenerator.new()

func _init():
	var g = Grid.new(10,10)
	
	for pos in g.positions():
		var node = Sprite.new()
		node.set_name("node")
		node.texture = tile_wall.sprite if g.isEdge(pos.x, pos.y) else tile_floor.sprite
		node.position = Vector2(pos.x*16, pos.y*16)
		add_child(node)
	
