import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog/main.dart';
import 'package:mini_katalog/models/product.dart';
import 'package:mini_katalog/services/cart_service.dart';

void main() {
  setUp(() {
    CartService.instance.clearCart();
  });

  testWidgets('MiniKatalogApp basic smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniKatalogApp());
    expect(find.text('Discover'), findsOneWidget);
  });

  test('CartService add, increase and clear test', () {
    final cart = CartService.instance;
    const testProduct = Product(
      id: 1,
      name: 'Test iPhone',
      tagline: 'Test Tagline',
      description: 'Test Description',
      price: r'$999',
      currency: 'USD',
      image: '',
    );

    expect(cart.totalItemCount, 0);
    cart.addProduct(testProduct);
    expect(cart.totalItemCount, 1);
    expect(cart.totalPrice, 999.0);

    cart.addProduct(testProduct);
    expect(cart.totalItemCount, 2);
    expect(cart.totalPrice, 1998.0);

    cart.decreaseQuantity(testProduct);
    expect(cart.totalItemCount, 1);

    cart.clearCart();
    expect(cart.totalItemCount, 0);
    expect(cart.totalPrice, 0.0);
  });
}
