## Strategy Pattern

### About
When you have multiple implements / algorithms of an operation and you want to use them interchangeably without altering the structure of the code.

### Solution
Create a base abstract class which declares the opertion to be performed. Define concrete classes which implement that opertions. These concrete cl;asses signifies different algorithms, approaches to solve the same problem. Client can change the algorithm on run time.


### Structure

- a base class which will have a method.
- Concrete classes for the base class with specific implementation.


I have implemented a payment mechanism which has the option to choose from differnt payment strategies.