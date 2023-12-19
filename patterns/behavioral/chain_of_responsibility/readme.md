## Chain of Responsibility


### About
This design solves the problem of multiple checks needed to be performed before performing a task or passing the data/request from one component to another.

When creating multiple requests and linking those requests, it creates a huge complex linked system and chaning one check may alter a complete link of checks which can alter the beahaviour to unknown.

### Solution
This solution says that assume all those checks are a stand alone classes with similar signature and one handler may or maynot have reference to next handler in line.


### Structure

- a base class which will act as a signature to request handlers.
- Concrete classes for the base class.
- client logic for chaining the responsibilities.


I have implemented a request chain which lets user to connect to some service.
It first checks for the IP request count, then it lets autheticate user, 
and finally lets user to connect to service.