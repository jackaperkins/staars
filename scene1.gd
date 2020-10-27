extends Node2D

var tile_floor = load("res://tiles/tile_floor.tres")
var tile_wall = load("res://tiles/tile_wall.tres")

var rng = RandomNumberGenerator.new()

func _init():
	print("hiu mom")
	
	for x in range(10):
		for y in range(10):
			var node = Sprite.new()
			node.set_name("node")
			node.texture = tile_floor.sprite if (rng.randf()>0.5) else tile_wall.sprite
			node.position = Vector2(x*16, y*16)
			add_child(node)
	
