using Godot;
using System;
using System.Numerics;
namespace FullSpeedAhead
{
    public partial class CenterOfMass : Node3D
    {
        public void AddVelocity(Godot.Vector2 thrustposition, Godot.Vector2 thrust)
        {

        }
        public override void _PhysicsProcess(double delta)
        {
            base._PhysicsProcess(delta);
        }

    }
}
