import 'package:equatable/equatable.dart';

class Weather extends Equatable{
  final double temp;
  final int humidity;

  const Weather({required this.temp, required this.humidity});

  @override
  // TODO: implement props
  List<Object?> get props => [temp, humidity];

}