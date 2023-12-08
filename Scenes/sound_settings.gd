extends CanvasLayer

@onready var BGM = $BGM
var bus_master = AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready():
	BGM.value = AudioServer.get_bus_volume_db(bus_master)





func _on_bgm_value_changed(value):
	AudioServer.set_bus_volume_db(bus_master, value)
	AudioServer.set_bus_mute(bus_master, value == BGM.min_value)
