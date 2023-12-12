## Proxy pattern

This provides a proxy / substitute class for the main class to the client. Generally we do it to control access to the main object coz either it is coslty to create another one or its secured object.


### Types of proxies

    1. `Remote proxy` : when the object is located remotely, we make client talk to local object which appears to be a remote one, relaying all the comm. to it.
    2. `Virtual proxy` : we kinda pass a dummy object (virtual) to client when it request for on while the object is loading. When the loading completes we then pass the actual object.
    3. `Logging proxy` : can use as a logging mechanism for the requests that are called by client for debugging and monitoring.
    4. `Caching proxy`  : Use it to cache the results of heavy operations and return it when accessed again. This improves performance.
    5. `Security Proxy` : When the object under consideration needs to be more secured and requires authenticated user check. Or you want to add additional layer of security for already working features (example would be encripting files before sending to server);
    6. `Smart Refernce Proxy`   : usecases would be tracking of object references, maintaing a count of it, free the object when references comes down to 0, lazily creating the objetc.

I have implemented Security, Logging & Caching proxy for now.