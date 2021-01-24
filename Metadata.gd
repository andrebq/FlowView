extends GraphNode
tool

class_name Metadata

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Connections.set_both_slot(self, 0, Connections.Types.KEY_VALUE,
		Connections.Types.METADATA)

func _on_Control_close_request() -> void:
	queue_free()


func _on_Control_resize_request(new_minsize: Vector2) -> void:
	new_minsize.y = rect_size.y
	rect_size = new_minsize
