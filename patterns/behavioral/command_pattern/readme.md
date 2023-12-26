## Command Pattern


### About
This design principle is needed when you want to decouple the sender (an object which wants to perform some execution) to the receiver (an object which will actually execute it). And treating an operation as a stand alone object with its params.

Why decoupling is needed in first place? Ther are many reasons for that. 

First is that your client /sender does not need to worry about the paramters to pass when trying to execute and operation, 

Second you can store the operations that has been performed and can revert back.

You can also maintian a queue for the sequnce of operations that needed to be perfomed.



### Structure

- A command class which has an abstraction of the execute method.
- Concrete command class with their implementations, paramters required for execution and instance of Receiver class.
- Client/Sender class which wants to execure something, it should hold instance of a command object.


I have implemented a text editor with undoable operation.
