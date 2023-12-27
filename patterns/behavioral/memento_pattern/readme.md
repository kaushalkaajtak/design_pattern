## Memento Pattern

### About
When you want to memorise all the operations that one has performed and may want to revert back, you can use memento pattern. It stores all the operations in a stack and restores when requested.

It does so by externalizing the state of the object into a seperate class (Memento).



### Structure

- Originator : A class whose objects needs to be stored or which has the object whose instance needs to be stores.
- Memento : A class where the originator's snapshot to be saved.
- Caretaker : A class which keeps track of different state of originator.


I have implemented text editor using memento pattern.



