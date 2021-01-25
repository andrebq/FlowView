tool
extends GraphNode

class_name Deployment

var metadata: Dictionary = {}

enum Slots {
	NAME = 0
	METADATA = 1
}

func _ready():
	Connections.set_both_slot(self, Slots.NAME, Connections.Types.TEXT, Connections.Types.TEXT)
	Connections.set_left_slot(self, Slots.METADATA, Connections.Types.METADATA)

func update_slot_data(from, from_slot, to_slot, value):
	if to_slot == Slots.METADATA:
		metadata = (value as Dictionary).duplicate(true)
		_update_deployment()

func _on_Block_resize_request(new_minsize: Vector2) -> void:
	rect_size = new_minsize

func _on_Block_close_request() -> void:
	queue_free()

func _update_deployment() -> void:
	$Metadata.clear()
	for k in metadata:
		$Metadata.add_item(k + ': ' + metadata[k])
