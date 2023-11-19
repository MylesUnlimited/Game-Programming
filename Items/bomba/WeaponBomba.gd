extends CollisionShape2D

	
func _on_timer_timeout():
	get_node('CollisionShape2D').disabled = false
	queue_free()
	
func bomba():
	pass
