import 'package:equatable/equatable.dart';

import 'item.dart';

class ListItemsModel extends Equatable {
  final List<Item>? items;

  const ListItemsModel({this.items});

  factory ListItemsModel.fromJson(Map<String, dynamic> json) {
    return ListItemsModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [items];
}
