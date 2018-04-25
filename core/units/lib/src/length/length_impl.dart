import 'ilength.dart';
import 'package:units/units.dart';

class LengthImpl implements ILength {

  static const double _m_to_cm = 100.0;
  static const double _cm_to_m = 0.001;
  static const double _m_to_ft = 3.28084;
  static const double _ft_to_m = 0.3048;
  static const double _m_to_inches = 39.3701;
  static const double _inches_to_m = 0.0254;

  @override
  double get inFeet => inMeters * _m_to_ft;
  @override
  double get inCentimeters => inMeters * _m_to_cm;
  @override
  double get inInches => inMeters * _m_to_inches;
  @override
  double get inKilometers => _length.inKilometers;
  @override
  double get inMeters => _length.inMeters;
  @override
  double get inMiles => _length.inMiles;

  final Length _length;

  LengthImpl.fromMeters([double meters = 0.0]):
        _length =  Length.fromMeters(value: meters);

  LengthImpl.fromKilometers([double kilometers = 0.0]):
        _length =  Length.fromKilometers(value: kilometers);

  LengthImpl.fromMiles([double miles = 0.0]):
        _length =  Length.fromMiles(value: miles);

  LengthImpl.fromFeet([double feet = 0.0]):
        this.fromMeters(feet * _ft_to_m);

  LengthImpl.fromCentimeters([double centimeters = 0.0]):
        this.fromMeters(centimeters * _cm_to_m);

  LengthImpl.fromInches([double inches = 0.0]):
        this.fromMeters(inches * _inches_to_m);

  @override
  int compareTo(ILength other) {
    return inMeters.compareTo(other.inMeters);
  }

  @override
  String toString() {
    return '[Length:m=$inMeters]';
  }

}
