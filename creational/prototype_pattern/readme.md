## Prototype Pattern

When you want to create an new object but want the instance to have same state as of the current instance and /or if the object construction is too complicated to start over all again.


In this we have an interface which has a `clone()` method which has the same return type as that of interface.

Concrete classes implement this interface and implement the clone() method.

Whenever the clone() method is called it creates a new instance which the same state. 

And after cloning one can update the parameters as the objects are mutable.


 

