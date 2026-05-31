import 'package:equatable/equatable.dart';

class InvoiceSettings extends Equatable {
  final dynamic customFields;
  final dynamic defaultPaymentMethod;
  final dynamic footer;
  final dynamic renderingOptions;

  const InvoiceSettings({
    this.customFields,
    this.defaultPaymentMethod,
    this.footer,
    this.renderingOptions,
  });

  factory InvoiceSettings.fromJson(Map<String, dynamic> json) {
    return InvoiceSettings(
      customFields: json['custom_fields'] as dynamic,
      defaultPaymentMethod: json['default_payment_method'] as dynamic,
      footer: json['footer'] as dynamic,
      renderingOptions: json['rendering_options'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'custom_fields': customFields,
    'default_payment_method': defaultPaymentMethod,
    'footer': footer,
    'rendering_options': renderingOptions,
  };

  @override
  List<Object?> get props {
    return [customFields, defaultPaymentMethod, footer, renderingOptions];
  }
}
