import 'package:equatable/equatable.dart';

import 'invoice_settings.dart';
import 'metadata.dart';

class CustomerModel extends Equatable {
  final String? id;
  final String? object;
  final dynamic address;
  final int? balance;
  final int? created;
  final dynamic currency;
  final dynamic defaultSource;
  final bool? delinquent;
  final dynamic description;
  final String? email;
  final String? invoicePrefix;
  final InvoiceSettings? invoiceSettings;
  final bool? livemode;
  final Metadata? metadata;
  final String? name;
  final int? nextInvoiceSequence;
  final dynamic phone;
  final List<dynamic>? preferredLocales;
  final dynamic shipping;
  final String? taxExempt;
  final dynamic testClock;

  const CustomerModel({
    this.id,
    this.object,
    this.address,
    this.balance,
    this.created,
    this.currency,
    this.defaultSource,
    this.delinquent,
    this.description,
    this.email,
    this.invoicePrefix,
    this.invoiceSettings,
    this.livemode,
    this.metadata,
    this.name,
    this.nextInvoiceSequence,
    this.phone,
    this.preferredLocales,
    this.shipping,
    this.taxExempt,
    this.testClock,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    id: json['id'] as String?,
    object: json['object'] as String?,
    address: json['address'] as dynamic,
    balance: json['balance'] as int?,
    created: json['created'] as int?,
    currency: json['currency'] as dynamic,
    defaultSource: json['default_source'] as dynamic,
    delinquent: json['delinquent'] as bool?,
    description: json['description'] as dynamic,
    email: json['email'] as String?,
    invoicePrefix: json['invoice_prefix'] as String?,
    invoiceSettings: json['invoice_settings'] == null
        ? null
        : InvoiceSettings.fromJson(
            json['invoice_settings'] as Map<String, dynamic>,
          ),
    livemode: json['livemode'] as bool?,
    metadata: json['metadata'] == null
        ? null
        : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    name: json['name'] as String?,
    nextInvoiceSequence: json['next_invoice_sequence'] as int?,
    phone: json['phone'] as dynamic,
    preferredLocales: json['preferred_locales'] as List<dynamic>?,
    shipping: json['shipping'] as dynamic,
    taxExempt: json['tax_exempt'] as String?,
    testClock: json['test_clock'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'object': object,
    'address': address,
    'balance': balance,
    'created': created,
    'currency': currency,
    'default_source': defaultSource,
    'delinquent': delinquent,
    'description': description,
    'email': email,
    'invoice_prefix': invoicePrefix,
    'invoice_settings': invoiceSettings?.toJson(),
    'livemode': livemode,
    'metadata': metadata?.toJson(),
    'name': name,
    'next_invoice_sequence': nextInvoiceSequence,
    'phone': phone,
    'preferred_locales': preferredLocales,
    'shipping': shipping,
    'tax_exempt': taxExempt,
    'test_clock': testClock,
  };

  @override
  List<Object?> get props {
    return [
      id,
      object,
      address,
      balance,
      created,
      currency,
      defaultSource,
      delinquent,
      description,
      email,
      invoicePrefix,
      invoiceSettings,
      livemode,
      metadata,
      name,
      nextInvoiceSequence,
      phone,
      preferredLocales,
      shipping,
      taxExempt,
      testClock,
    ];
  }
}
