extends RayCast2D

export var link_path : NodePath = ""
onready var link = get_node(link_path)

func _physics_process(delta):
	cast_to = link.global_position - global_position
	$Outline.points[1] = cast_to
	$Inline.points[1] = cast_to
	if is_colliding():
		var collider = get_collider()
		if collider.owner is Turret:
			collider.owner.destroy()
