tool
extends GraphNode

class_name Deployment

func _ready():
	Connections.set_left_slot(self, 1, Connections.Types.METADATA)

func _on_Block_resize_request(new_minsize: Vector2) -> void:
	rect_size = new_minsize


func _on_Block_close_request() -> void:
	queue_free()
