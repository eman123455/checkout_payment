import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '5000',
      currency: 'USD',
      customerId: 'cus_UcCLU21nVFh3a8',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).processPayment(paymentIntentInputModel: paymentIntentInputModel);
  }