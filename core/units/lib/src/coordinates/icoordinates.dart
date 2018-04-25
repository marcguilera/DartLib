import 'package:lib.core.units/units.dart';
abstract class ICoordinates {
  IAngle get latitude;
  IAngle get longitude;
  String get inSexagesimal;
  ICoordinates round({int decimals = 6});
  ILength distanceTo(ICoordinates other);
  bool operator==(final Object other);
  int get hashCode;
}