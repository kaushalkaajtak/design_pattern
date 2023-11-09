## Builder Pattern

When you have very complex objection creation i.e lets say more than 10 paramters,
some of which may or may not be optional. In those cases its better to create a 
system which will help client in constructing the object step by step format.


### Our case
We have a `Person` class which a client will construct using `PersonBuilder` class which is an static instance. We kept it static so that client doesnt make new instance every time it asks for builder class.


PersonBuilder makes it easier to create a person. Client can either call `build()` method directly or can use personBuilder's setters to add values to optional params.


This way client can construct person according to their requirements. After construction the client will call `build()` method on the personBuilder. This will return a new instance of the person class. 

Those instances are immutable.


A better example would be a `Burger` class and `BurgerBuilder` with client as end user.




