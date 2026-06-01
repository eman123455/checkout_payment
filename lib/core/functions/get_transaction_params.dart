  import 'package:checkout_payment/features/checkout/data/models/paypal/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/list_items_model/item.dart';
import 'package:checkout_payment/features/checkout/data/models/paypal/list_items_model/list_items_model.dart';

Map<String, dynamic> getTransactionParams() {
    final amount = AmountModel(
      total: '70',
      currency: 'USD',
      details: Details(subtotal: '70', shipping: '0', shippingDiscount: 0),
    );
    List<OrderItemModel> items = [
      OrderItemModel(name: "Apple", quantity: 4, price: '5', currency: "USD"),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: '10',
        currency: "USD",
      ),
    ];
    final itemsList = ListItemsModel(items: items);
    return {
      "amount": amount.toJson(),
      "description": "The payment transaction description.",
      "item_list": itemsList.toJson(),
    };
  }