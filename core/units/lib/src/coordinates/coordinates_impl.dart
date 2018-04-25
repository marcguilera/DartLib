import 'package:latlong/latlong.dart';
import 'package:lib.core.units/units.dart';
import 'icoordinates.dart';
import 'package:meta/meta.dart';
import 'package:quiver/check.dart';

class CoordinatesImpl implements ICoordinates {

  final LatLng _latlng;

  @override
  IAngle get latitude =>  AngleImpl.fromDegrees(_latlng.latitude);

  @override
  IAngle get longitude =>  AngleImpl.fromDegrees(_latlng.longitude);

  CoordinatesImpl({
    @required IAngle latitude,
    @required IAngle longitude
  }): this.fromDegrees(
      latitude: checkNotNull(latitude, message: 'latitude is null').inDegrees,
      longitude: checkNotNull(longitude, message: 'longitude is null').inDegrees);

  CoordinatesImpl.fromDegrees({
    double latitude = 0.0,
    double longitude = 0.0
  }): _latlng =  LatLng(
      checkNotNull(latitude, message: 'latitude is null'),
      checkNotNull(longitude, message: 'longitude is null')
  );

  @override
  String get inSexagesimal => _latlng.toSexagesimal();

  @override
  ICoordinates round({int decimals: 6}) {
    final ll = _latlng.round(decimals: decimals);
    return  CoordinatesImpl.fromDegrees(latitude: ll.latitude, longitude: ll.longitude);
  }

  @override
  bool operator==(final Object other) {
    return other != null && other is ICoordinates && latitude == other.latitude && longitude == other.longitude;
  }

  int get hashCode => _latlng.longitude.hashCode + _latlng.latitude.hashCode;

  @override
  ILength distanceTo(ICoordinates other) {
    checkNotNull(other, message: () => 'other is null');
    final Distance distance =  Distance();
    final kms = distance.as(LengthUnit.Kilometer, _latlng,  LatLng(other.longitude.inDegrees, other.latitude.inDegrees));
    return  LengthImpl.fromKilometers(kms);
  }

  @override
  String toString() {
    return '[Coordinates:lat=$latitude;lng=$longitude]';
  }

}