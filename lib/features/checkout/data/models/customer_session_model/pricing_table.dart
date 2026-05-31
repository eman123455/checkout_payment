import 'package:equatable/equatable.dart';

class PricingTable extends Equatable {
  final bool? enabled;

  const PricingTable({this.enabled});

  factory PricingTable.fromJson(Map<String, dynamic> json) =>
      PricingTable(enabled: json['enabled'] as bool?);

  Map<String, dynamic> toJson() => {'enabled': enabled};

  @override
  List<Object?> get props => [enabled];
}
