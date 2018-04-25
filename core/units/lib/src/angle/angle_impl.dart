import 'iangle.dart';
import 'package:units/units.dart';

class AngleImpl implements IAngle {
  final Angle _angle;

  @override
  double get inDegrees => _angle.inDegrees;

  @override
  double get inRadians => _angle.inRadians;

  AngleImpl.fromDegrees([double degrees = 0.0]):
        _angle =  Angle.fromDegrees(value: degrees);

  AngleImpl.fromRadians([double radians = 0.0]):
        _angle =  Angle.fromRadians(value: radians);

  @override
  int compareTo(IAngle other) {
    return inDegrees.compareTo(other.inDegrees);
  }

  @override
  String toString() {
    return '[Angle:deg=$inDegrees]';
  }

}
