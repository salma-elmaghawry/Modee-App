import 'package:bloc/bloc.dart';
import 'package:markatty/Features/Cart/presentation/Manager/cart_state.dart';
import 'package:markatty/Features/Home/presentation/Widgets/product_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartEntry> _items = [];

  void addToCart(ProductModelUi product) {
    final index = _items.indexWhere(
      (element) =>
          element.product.name == product.name &&
          element.product.price == product.price,
    );
    if (index >= 0) {
      final existing = _items[index];
      _items[index] = existing.copyWith(quantity: existing.quantity + 1);
    } else {
      _items.add(CartEntry(product: product, quantity: 1));
    }
    final List<CartEntry> updated = List<CartEntry>.from(_items);
    emit(CartUpdated(updated));

  }

  void removeFromCart(ProductModelUi product) {
    _items.removeWhere(
      (element) =>
          element.product.name == product.name &&
          element.product.price == product.price,
    );
    final List<CartEntry> updated = List<CartEntry>.from(_items);
    emit(CartUpdated(updated));
  }

  void changeQuantity(ProductModelUi product, int quantity) {
    final index = _items.indexWhere(
      (element) =>
          element.product.name == product.name &&
          element.product.price == product.price,
    );
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index] = _items[index].copyWith(quantity: quantity);
      }
      final List<CartEntry> updated = List<CartEntry>.from(_items);
      emit(CartUpdated(updated));
    }
  }

  void clearCart() {
    _items.clear();
    emit(CartUpdated(List<CartEntry>.from(_items)));
  }
}
