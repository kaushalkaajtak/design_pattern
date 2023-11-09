## Adapter Pattern

Enables us to use a service needed by client which is incompatible with it.
We make it compatible by extending a the existing interface that the client adher to, which acts as an adpater between the client needs and the service apis.

The adpater class generally extends the clients interface and contains the dependency of the service class
and implements the methods of the client.

notice the `playMedia()` client method doesnt contains the reference to concrete implementations.

