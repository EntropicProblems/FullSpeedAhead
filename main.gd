extends Node3D
func _ready() -> void:
	single_pilot()
func build_thrusters(ship:Node3D):
	var flight_controller= preload("res://CraftComponents/flight_controller.tscn").instantiate()
	ship.add_child(flight_controller)
	for i in ship.get_children():
		if i as ThrusterStorage != null:
			#we have our thruster_storage, now build and link up the thrusters
			pass
func single_pilot():
	var my_pilot = load(file_macro.macrofile["base_pilot"])
	var live_pilot:Pilot = my_pilot.instantiate()
	live_pilot.ask_for_ship.connect(give_ship)
	add_child(live_pilot)
func give_ship(pilot, ship_type):
	var new_ship = load(file_macro.shipfile[ship_type]).instantiate()
	add_child(new_ship)
	pilot.ship = new_ship
