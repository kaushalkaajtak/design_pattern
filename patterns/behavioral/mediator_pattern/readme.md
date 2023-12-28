## Mediator Pattern

### About
This pattern decouples differnet classes which were else closely linked to each other for co-ordination based logics. They all use a single mediator class onject which is aware of all the differnt classes and all the class holds this mediator Object. They notify the changes to the mediator and it will further relay communication to required class.


### Structure
- An interface which will be a mediator with notify method, and parms to understand the current event.
- Concrete implementation of mediator.
- An interface for a single component.
- Concrete implementation of component class which holds refernce to mediator. 


I have implemented Mediator pattern in combination with Observer pattern. I have implemented a form base GUI system where once you entered name and ticked check box, the save button will be active else it will be diabled.





