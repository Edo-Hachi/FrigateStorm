extends Area3D

enum EnumDirection {MOVE_LEFT, MOVE_RIGHT}

@export var Direction = EnumDirection.MOVE_LEFT
@export var Speed = 80
@export var Depth = 10

@export var LeftSide = -180
@export var RightSide = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	var rotation_degrees = Vector3(0, -90, 0)
	
	if Direction == EnumDirection.MOVE_LEFT:
		#transform.rotated_local(Vector3(0, 1, 0), deg_to_rad())
		transform.basis = Basis().rotated(Vector3(0, 1, 0), deg_to_rad(rotation_degrees.y))
	else:
		rotation_degrees = Vector3(0, 90, 0)
		transform.basis = Basis().rotated(Vector3(0, 1, 0), deg_to_rad(rotation_degrees.y))
		
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Dir = 0
	if Direction == EnumDirection.MOVE_LEFT:
		Dir = -1
		if position.x < LeftSide:
			position.x = RightSide
		
	else:
		Dir = 1
		if RightSide < position.x:
			position.x = LeftSide
	
	position.x += Dir * Speed * delta
	
		
	pass


func _on_body_entered(body):
	print("Hit Body")
	pass # Replace with function body.


func _on_area_entered(area):
	print("Hit Area")
	pass # Replace with function body.
