import 'package:equatable/equatable.dart';

class Features extends Equatable {
  final List<dynamic>? paymentMethodAllowRedisplayFilters;
  final String? paymentMethodRedisplay;
  final String? paymentMethodRemove;
  final String? paymentMethodSave;
  final dynamic paymentMethodSaveAllowRedisplayOverride;

  const Features({
    this.paymentMethodAllowRedisplayFilters,
    this.paymentMethodRedisplay,
    this.paymentMethodRemove,
    this.paymentMethodSave,
    this.paymentMethodSaveAllowRedisplayOverride,
  });

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    paymentMethodAllowRedisplayFilters:
        json['payment_method_allow_redisplay_filters'] as List<dynamic>?,
    paymentMethodRedisplay: json['payment_method_redisplay'] as String?,
    paymentMethodRemove: json['payment_method_remove'] as String?,
    paymentMethodSave: json['payment_method_save'] as String?,
    paymentMethodSaveAllowRedisplayOverride:
        json['payment_method_save_allow_redisplay_override'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'payment_method_allow_redisplay_filters':
        paymentMethodAllowRedisplayFilters,
    'payment_method_redisplay': paymentMethodRedisplay,
    'payment_method_remove': paymentMethodRemove,
    'payment_method_save': paymentMethodSave,
    'payment_method_save_allow_redisplay_override':
        paymentMethodSaveAllowRedisplayOverride,
  };

  @override
  List<Object?> get props {
    return [
      paymentMethodAllowRedisplayFilters,
      paymentMethodRedisplay,
      paymentMethodRemove,
      paymentMethodSave,
      paymentMethodSaveAllowRedisplayOverride,
    ];
  }
}
