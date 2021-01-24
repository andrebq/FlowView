extends Node
tool

class_name Connections

enum Types {
	KEY_VALUE,
	METADATA,
	DEPLOYMENT,
	
	TEXT
}

static func set_left_slot(node: GraphNode, idx :int, type: int) -> void:
	node.set_slot(idx, true, type, colorFor(type), false, -1, colorFor(-1))

static func set_right_slot(node: GraphNode, idx: int, type: int) -> void:
	node.set_slot(idx, false, -1, colorFor(-1), true, type, colorFor(type))

static func set_both_slot(node: GraphNode, idx: int, l_type: int, r_type: int) -> void:
	node.set_slot(idx, true, l_type, colorFor(l_type), true, r_type, colorFor(r_type))


static func colorFor(type: int) -> Color:
	if type == Types.METADATA:
		return Color.red
	elif type == Types.KEY_VALUE:
		return Color.blue
	elif type == Types.DEPLOYMENT:
		return Color.green
	elif type == Types.TEXT:
		return Color.pink
	return Color.black
