## Structural Pattern

The problem arise when there are two differnet things growing in two different dimentions but using inheritance. The problem with inheritance is that with such multi-dimentional things the number of classes to support those use cases grows at a much faster rate.

### example

Consider an interface shape. You extend it for having a triange and circle. Then you thought now lets add color to it so you extend it with color also. Suppose the implementation of 2 shapes with 3 colors, the number of classes to implement would be 2*3=6.

### Solution

Rather using inheritance use composition in this case. It will then allow the two differnt entities Shape and Color to grow seperatly without any impact.

abstract class Color{
      int val;
     Color(this.val);
}


abstract class Shape{
    final Color color;

    Shape(this.color);

    void draw();
}


void client(){
var shape = Triangle(color:Red(val:123));
shape.draw();
}