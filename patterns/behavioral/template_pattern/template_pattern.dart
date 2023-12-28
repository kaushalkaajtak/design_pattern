import '../../creational/factory_method/factory_method.dart';

abstract class CartTemplate {
  // the skeletion method.
  Future<void> processOrder(Cart cart) async {
    print('------------------- $this-----------------');
    await validateCart(cart);
    calculateShipping(cart);
    collectPayment(cart);
    confirmOrder(cart);
    print('------------------- end -----------------');
  }

  // Abstract methods
  Future<void> validateCart(Cart cart) async {
    print("checked if all items are currently available");
  }

  Future<double> calculateShipping(Cart cart);
  Future<void> collectPayment(Cart cart);
  Future<void> confirmOrder(Cart cart);
}

class Cart {}

abstract class User {}

class GuestUser extends User {}

class RegisteredUser extends User {}

class GuestUserCart extends CartTemplate {
  final GuestUser user;

  GuestUserCart({required this.user});
  @override
  Future<double> calculateShipping(Cart cart) async {
    print('ask for location');
    print('calculate amount acc to loc and cart itmes : 100/-');
    return 100;
  }

  @override
  Future<void> collectPayment(Cart cart) async {
    print('Ask for payment detials');
    print('make the payment');
  }

  @override
  Future<void> confirmOrder(Cart cart) async {
    print('confirm the order');
  }
}

class RegisteredUserCart extends CartTemplate {
  final RegisteredUser user;

  RegisteredUserCart({required this.user});
  @override
  Future<double> calculateShipping(Cart cart) async {
    print('ask for saved locations if any');
    print('calculate amount acc to loc and cart itmes : 100/-');
    print('provide discount for registernd user : 90/-');
    return 90;
  }

  @override
  Future<void> collectPayment(Cart cart) async {
    print('Ask detials from saved section');
    print('make the payment');
  }

  @override
  Future<void> confirmOrder(Cart cart) async {
    print('confirm the order');
  }
}

Future<void> client(CartTemplate template) async {
  await template.processOrder(Cart());
}

void main() async {
  await client(GuestUserCart(user: GuestUser()));
  await client(RegisteredUserCart(user: RegisteredUser()));
}
