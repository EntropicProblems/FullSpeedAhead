class_name Pilot
extends CharacterBody3D

@export var ship:Node3D
var flight_controller
#we use this to store the thrust grouping, where each grouping pointed in the direction of a positive or negative basis
var thruster_combinations:Array
#this stores the associated basis with the same index as the thrust combination of the array above
var thrust_basis:PackedVector3Array
#this is used to get our ship when we begin
signal ask_for_ship(myself, ship_type)
#when we use inputs for movement, we check the array for a valid thruster combination
func _ready() -> void:
	#get our ship
	await ask_for_ship.emit(self, "base")
	flight_controller = ship.get_node("FlightController")
func _process(delta: float) -> void:
	print(ship.global_position) #just some filler to do some testing
	var hormovement = Input.get_vector("thr_left", "thr_right", "thr_frd", "thr_bwd")
	var vertmov = Input.get_axis("thr_up", "thr_dwn")
	var movement = Vector3(hormovement.x, vertmov, hormovement.y)
	#talk to your child FlightController
	flight_controller.fire_thrusters(movement, Vector2.ZERO, ship)
