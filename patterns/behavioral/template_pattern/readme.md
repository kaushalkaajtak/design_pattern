## Template Pattern

### About
When you have an operation which can be divided into steps (algorithms) and that operation can have subclasses representing different bahaviours, it might just repeat the algorithms in differnt place and many all of the logics will be repeated.

### Solution
A template / Skeleton of the algorithms can be created. We can do this by dividing the process/operation into different algorithms and write abstract methods for the same or can provide implementations.

Those methods which involves differnet logic for differnt subclasses should be abstract in nature and let the subclass provide the implementaions.

This way you will not dublicate the code and can able to provide implemenation to differnt subclasses.


### Structure

- A base template method which has the base operations with or without implementations and with order of the operations.
- Concrete class for the methods which whose behaviours change according to differnt subclasses/types.


I have implemented a Checkout process template. Concrete implementations are for GuestUser and RegisterdUser.
