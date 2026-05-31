import 'package:equatable/equatable.dart';

import 'features.dart';

class MobilePaymentElement extends Equatable {
  final bool? enabled;
  final Features? features;

  const MobilePaymentElement({this.enabled, this.features});

  factory MobilePaymentElement.fromJson(Map<String, dynamic> json) {
    return MobilePaymentElement(
      enabled: json['enabled'] as bool?,
      features: json['features'] == null
          ? null
          : Features.fromJson(json['features'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
    'enabled': enabled,
    'features': features?.toJson(),
  };

  @override
  List<Object?> get props => [enabled, features];
}
