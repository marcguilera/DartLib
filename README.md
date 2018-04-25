# DartLib

The goal of this library is to provide structure over [AngularDart](https://webdev.dartlang.org/angular/) and [Flutter](https://flutter.io) as well as some Dart functionality. 

## Structure

![Img](https://image.ibb.co/dgp8Nx/lib_struc.png)

- **Core:** Common functionality that can be used in the frontend and in the backend.
- **Frontend:** Everything that will be rendered on a screen.
- **Backend:** To do

### Core

This folder contains everything that is completely platform agnostic and is used by other parts of the code. 

**Packages:**

- **Di:** Provided an IoC container to perform compile time dependency injection throughout the app. 
- **Rx:** A layer on top or [RxDart](https://github.com/ReactiveX/rxdart). 
- **Shared:** Common classes.
- **Units:** Unit classes such as angles, coordinates, length etc. with useful conversion utilities.
- **Validation:** Validation utilities for emails, passwords, etc.

### Frontend

Contains everything that will be rendered on a screen. I provide the Flutter implementation but feel free to use any other frontend.

**Packages:**

- **Core:** Platform agnostic common utilities.
    - **Auth:** Generic authentication utilities for an application.
    - **App:** Parent classess and utilities to create a mobile or web application.
    - **Routing:** To move between screens.
- **Mobile:** 
    - **App:** Flutter specific app utilities.
    - **Auth:** Abstraction over the [Firebase](https://firebase.google.com/) authentication.
    - **Routing:** [Fluro](https://github.com/goposse/fluro) specific routing.
- **Web:** To do

[Read more...](frontend)
    

## Usage
The independent modules aren't published in pub (yet). You can clone the repository and tinker with it.    

## Rules    

1. The dependency tree flows up to down and should always be that way, ie: never have flutter dependencies in the core folder. 

2. We should always shoot to have as much logic as possible at the top of the tree which means more reusability.

3. Shared folders are fine for small classes that don't fit anywhere but any significant logical part should have its own folder.