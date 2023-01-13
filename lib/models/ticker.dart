import 'package:equatable/equatable.dart';

class Ticker extends Equatable {
  final double price;
  final String streamId;

  const Ticker({
    required this.price,
    required this.streamId,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) {
    return Ticker(
      price: json['quote']?.toDouble(),
      streamId: json['id'],
    );
  }

  @override
  List<Object?> get props => [
        price,
        streamId,
      ];
}
