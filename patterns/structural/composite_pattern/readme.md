## Composite Pattern

It becomes a use case for design when the problem in picture has hierarchies , ex would be a file and folder struture. Since hierarchies resembles tree structure we compose those objects in a tree sturcture so that we can perform opertions on them as if they are one.

Example would be getting the size of a folder, which in turn checks the sizes of its internal folders and those folders checks the sizes of folder and file inside them and so on.


You wanna use it when you want to perform batch operation at once with single command. (just like in case of folders you might wanna move them to another directory, delete all the files in folder etc)