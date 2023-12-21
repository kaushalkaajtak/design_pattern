## Observer Pattern


### About
This design pattern is required when  you want mutiple listeners for a single refernce point. You want to notify all listeners at once about any change that has occured to the parent object.



### Structure

- An observer base class which has a method for update.
- A subject class for handling the referneces of all the listerns (Observer),
adding, removing, updating all the listeners.
- Implementing the observers and subjects classes.


I have implemented a UserObserver and UserSubject. UserObserver is a single instance which will get latest updates when the UserSubject notifies the updated to all registered observers.
