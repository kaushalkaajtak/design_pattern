## State Pattern

### About
It sovles the problem of Finite state Machine. So in this pattern an object can asuume different states in the program's life time and one must handle the differnt states. Now the problem arrise when you use conditionals (if/switch) to implement that. When a new state arise it will start boating up the class.

### Solution
We can implement stand alone states which will extend a state interface and the object which will assume different state will hold the refernce to this state class. Now as according to state the behaviour of the object should also change, we will implement differnt behavious in the respective state class, hence saving complications of maintaining all the logic at one place.

### Structure
- A context class which will assume different states as the programs runs.
- An interface class State, whcih will have some methods which will alter behaviour according to state.
- Concrete state implementations.


I have implemented a simple counter state pattern.