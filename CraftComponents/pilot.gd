extends CharacterBody3D

@export var ship:Node3D
#we use this to store the thrust grouping, where each grouping pointed in the direction of a positive or negative basis
var thruster_combinations:Array
#this stores the associated basis with the same index as the thrust combination of the array above
var thrust_basis:PackedVector3Array
#this is used to get our ship when we begin
signal ask_for_ship(myself, ship_type)
#when we use inputs for movement, we check the array for a valid thruster combination
func _ready() -> void:
	#get our ship
	ask_for_ship.emit(self, "base")
func _process(delta: float) -> void:
	print(delta) #just some filler to do some testing
	var hormovement = Input.get_vector("thr_left", "thr_right", "thr_frd", "thr_bwd")
	var vertmov = Input.get_axis("thr_up", "thr_dwn")
	var movement = Vector3(hormovement.x, vertmov, hormovement.y)
	if thrust_basis.has((Vector3.RIGHT * movement).normalized()):
		pass
	elif movement.x == 0:
		pass
	else:
		pass #find a function for getting the thrust optimum for going left/right, depending on if movement.x is negative
	if thrust_basis.has((Vector3.DOWN * movement).normalized()):
		pass
	elif movement.y == 0:
		pass
	else:
		pass #find a function for getting the thrust optimum for going down/up, depending on if movement.y is negative
	if thrust_basis.has((Vector3.BACK * movement).normalized()):
		pass
	elif movement.z == 0:
		pass
	else:
		pass #find a function for getting the thrust optimum for going backwards/forwards, depending on if movement.z is negative
