## Facade Pattern

It is needed to reduce the complexity of managing differnet subsystem as dependencies to a single interface. The client will talk to the facade only which will remove the extra dependencies from the client.

This pattern encapsualates the complex logics required for an operation and exposes a very simple interface for the client to use. Clinet is unaware of all the subsystems and the subsystems are also unaware of the facade making it possible for everyone to work with each other without introducing coupling between client and subsystems.


Difference from adapter pattern?:

In adapter pattern the adapter needs to extend already present interface to client and implenment it.
In facade however we create a new interface and encapsulate complex subsystem logic into it.