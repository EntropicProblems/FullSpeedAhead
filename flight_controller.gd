extends Node
func fire_thrusters(linear_direction:Vector3, angular_direction:Vector3, ship:RigidBody3D):
	ship.apply_central_force(linear_direction)
	ship.apply_torque(angular_direction)
