import 'package:equatable/equatable.dart';

class PaymentElement extends Equatable {
  final bool? enabled;
  final dynamic features;

  const PaymentElement({this.enabled, this.features});

  factory PaymentElement.fromJson(Map<String, dynamic> json) {
    return PaymentElement(
      enabled: json['enabled'] as bool?,
      features: json['features'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {'enabled': enabled, 'features': features};

  @override
  List<Object?> get props => [enabled, features];
}
