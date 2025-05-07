using Godot;
using Godot.Collections;
using System;
namespace FullSpeedAhead
{
    public partial class CenterOfMass : Node3D
    {
        private Vector3 LinearVelocity = Vector3.Zero;
        private Vector3 RotationalVelocity = Vector3.Zero;
        public void AddVelocity(Vector3 thrustposition, Vector3 thrust)
        {
            Vector3 relativeposition = -1 * thrustposition;
            float magn = thrust.Length();
            Vector3 rotationdifference = new Vector3(relativeposition.Normalized().X - thrust.Normalized().X, relativeposition.Normalized().Y - thrust.Normalized().Y, relativeposition.Normalized().Z - thrust.Normalized().Z);
            rotationdifference *= magn;
            RotationalVelocity += rotationdifference;
            magn -= rotationdifference.X + rotationdifference.Y + rotationdifference.Z;
            LinearVelocity += thrust.Normalized() * magn;
        }
        public override void _PhysicsProcess(double delta)
        {
            base._PhysicsProcess(delta);
            this.GlobalPosition += LinearVelocity * (float)delta;
            this.Rotate(Vector3.Right, RotationalVelocity.X);
            this.Rotate(Vector3.Down, RotationalVelocity.Y);
            this.Rotate(Vector3.Back, RotationalVelocity.Z);
        }

    }
}
