## Factory Method 

It consists of a product, which in our case is a `Car` and a factory i.e `CarFactory` which is a blueprint / interface for constructing a car.

Concrete class like `MarutiFactory` and `AudiFactory` can implement this factory
and provide implementation for the same.

Clinet will have reference to the interface and on run time asks for the instance of concrete object.


