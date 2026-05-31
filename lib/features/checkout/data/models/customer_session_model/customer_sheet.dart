import 'package:equatable/equatable.dart';

class CustomerSheet extends Equatable {
  final bool? enabled;
  final dynamic features;

  const CustomerSheet({this.enabled, this.features});

  factory CustomerSheet.fromJson(Map<String, dynamic> json) => CustomerSheet(
    enabled: json['enabled'] as bool?,
    features: json['features'] as dynamic,
  );

  Map<String, dynamic> toJson() => {'enabled': enabled, 'features': features};

  @override
  List<Object?> get props => [enabled, features];
}
