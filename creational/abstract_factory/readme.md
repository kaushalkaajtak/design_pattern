## Abstract factory pattern

When you need to create / instantiate objects which relates with each other in some way.

### Example in our case:

We have a `Factory` which creates products required by the car (wheels , engine).

Different car manufacturers provide concrete implemetation (`AudiFactory` , `MarutiFactory`).


### working and features

Client code generally has access to `Factory` interface and is free from references of concrete 
implementations making it decoupled and hence easy to test.

Removes the complexity for the client to create and configure objects.


### To summarise :

Related products : `Wheels`, `Engine`
Blue print of factory : `Factory` interface
Concrete implementation : `AudiFactory` , `MaurityFactory`


