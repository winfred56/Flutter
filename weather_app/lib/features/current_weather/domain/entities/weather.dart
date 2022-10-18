import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final double temp;
  final double main;

  const Weather({required this.temp, required this.main});

  @override
  // TODO: implement props
  List<Object?> get props => [temp, main];

}