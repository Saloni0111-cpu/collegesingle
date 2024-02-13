extends Node3D
#TIP: Drag the node + press Control, then drop
@onready var player = $"Basic FPS Player"

func _physics_process(delta):
	get_tree().call_group("enemy", "update_target_location", player.global_transform.origin)
	
	

