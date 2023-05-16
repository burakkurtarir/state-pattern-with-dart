# State Design Pattern with Dart

State is a behavioral design pattern. The State pattern suggests that you create new classes for all possible states of an object and extract all state-specific behaviors into these classes.

![State Design Pattern](/state_pattern_image.png)

![State Design Pattern](/state_pattern_image_2.png)

## Main Idea

At any given moment, there’s a finite number of states which a program can be in. Within any unique state, the program behaves differently, and the program can be switched from one state to another instantaneously. However, depending on a current state, the program may or may not switch to certain other states. These switching rules, called transitions, are also finite and predetermined.

## Example Description

In my example; we have a document and we can publish and save as draft this document.
**DocumentState** is our base state and **Published**, **Draft**, **Moderation** classes are inherited from base state.
**Document** class stores the state and when you call publish or save as draft function, it delegate all the work to the state.
And we have a **User** class to manage administration work.

You can see the image below

![State Design Pattern Screenshot 1](/ss-1.png)