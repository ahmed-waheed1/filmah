import 'package:equatable/equatable.dart';

class MovieDatesEntity extends Equatable {
  final DateTime? maximum;
  final DateTime? minimum;

  const MovieDatesEntity({
    this.maximum,
    this.minimum,
  });

  @override
  List<Object?> get props => [maximum, minimum];
}
