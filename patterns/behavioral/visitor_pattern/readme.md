## Visitor Pattern

### About
To be used when you dont want the objects to be coupled with the logics / algos they work upon. Imagine you have some data points which you want to represent as some graph. You implemented the logic into the data points class. Now the requirement comes to implement all sorts of graphs, making your data point class bluky and fagile to change.


### Solution
We will make a base visitor class which will have all the methods for performing the logic for differnt types pf graphs. Then we will implement concrete graph visitors for differnt elements (data points, series, charts).

And every element implements a base element class which has a method to accept a visitor. This way we have de-coupled the logic with the specific elements.


### Structure
- A visitor base class which has methods for all the element subclasses.
- A element base class which accept visitor.
- Concrete visitor and element classes.

I have implemented data visualization system where we can visualize different types of graphs for differnt types of data points.

