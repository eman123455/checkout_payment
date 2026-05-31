import 'package:equatable/equatable.dart';

class BuyButton extends Equatable {
  final bool? enabled;

  const BuyButton({this.enabled});

  factory BuyButton.fromJson(Map<String, dynamic> json) =>
      BuyButton(enabled: json['enabled'] as bool?);

  Map<String, dynamic> toJson() => {'enabled': enabled};

  @override
  List<Object?> get props => [enabled];
}
