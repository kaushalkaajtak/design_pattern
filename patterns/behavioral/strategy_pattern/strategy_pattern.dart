abstract class PaymentStrategy {
  void makePayment();
}

class UPIStratgy extends PaymentStrategy {
  final String upiId;
  final num amount;

  UPIStratgy(this.amount, {required this.upiId});
  @override
  void makePayment() {
    print('made payment using upi is: $upiId  $amount');
  }
}

class CreditCard extends PaymentStrategy {
  final String name;
  final String cardNum;
  final num amount;

  CreditCard({required this.name, required this.cardNum, required this.amount});
  @override
  void makePayment() {
    print('made payment using credit card $cardNum  $name  $amount');
  }
}

class ShoppingCartContext extends PaymentStrategy {
  PaymentStrategy? _paymentStrategy;

  void setStrategy(PaymentStrategy strategy) {
    _paymentStrategy = strategy;
    print('selectd strategy $strategy');
  }

  @override
  void makePayment() {
    _paymentStrategy?.makePayment();
  }
}

void main() {
  ShoppingCartContext context = ShoppingCartContext();

  context.setStrategy(UPIStratgy(50, upiId: 'upiId'));
  context.makePayment();

  context.setStrategy(CreditCard(name: 'name', cardNum: 'cardNum', amount: 50));
  context.makePayment();
}
