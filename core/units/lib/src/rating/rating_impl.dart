import 'irating.dart';

class RatingImpl implements IRating {

  static const double _g_to_r = 0.1;
  static const double _p_to_r = 0.01;
  static const double _s_to_r = 0.5;
  static const double _r_to_g = 10.0;
  static const double _r_to_p = 100.0;
  static const double _r_to_s = 5.0;

  final double _rate;

  @override
  double get inRate => _rate;

  @override
  double get inPercentage => _rate * _r_to_p;

  @override
  double get inStars => _rate * _r_to_s;

  @override
  double get inGrade => _rate * _r_to_g;

  RatingImpl.fromRate([double rate = 0.0]):
      _rate = rate;

  RatingImpl.fromGrade([double grade = 0.0]):
      _rate = grade * _g_to_r;

  RatingImpl.fromPercentage([double percentage = 0.0]):
      _rate = percentage * _p_to_r;

  RatingImpl.fromStars([double stars = 0.0]):
      _rate = stars * _s_to_r;

  @override
  int compareTo(IRating other) {
    return inRate.compareTo(other.inRate);
  }

  @override
  String toString() {
    return '[Rating:percentage=$inPercentage]';
  }

}