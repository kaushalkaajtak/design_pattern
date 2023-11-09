## Flyweight Pattern

This pattern is used to optimize the code in a way that it consumes less memory for similar kind of objects. 

An exmaple would be a game where you need to create a bullet object. Now different bullets can vary in features like type, size etc but for similar type of bullets sprite and color would be same. So instead of adding those paramters in the main object, its better to add those parameters in a seperate object and call it when required thus saving memory.

That new class should be cached. That class is know as flyweight class. One can also create a flyweight factory which can differnt tyoes fo flyweights and return the exact one required by current object.