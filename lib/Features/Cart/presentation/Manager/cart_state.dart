import 'package:equatable/equatable.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';

class CartEntry extends Equatable {
  final ProductModelUi product;
  final int quantity;

  const CartEntry({required this.product, required this.quantity});

  CartEntry copyWith({int? quantity}) =>
      CartEntry(product: product, quantity: quantity ?? this.quantity);

  @override
  List<Object?> get props => [product, quantity];
}

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartEntry> items;

  const CartUpdated(this.items);

  double get total =>
      items.fold(0.0, (sum, it) => sum + it.product.price * it.quantity);

  @override
  List<Object?> get props => [items];
}
