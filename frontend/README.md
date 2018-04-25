# lib.frontend

![Angular icon](https://raw.githubusercontent.com/dart-lang/logos/master/logos_and_wordmarks/angulardart-logo.png)
![Flutter logo](https://cdn.codemate.com/wp-content/uploads/2017/09/flutter-logo-small.png)

The frontend is whatever will be rendered by **Flutter** or **Angular** on a user's screen. We have developed a framework to help with testability and code reusability.

## The framework

The frontend framework is set up so that all business logic is platform agnostic to make sure we are reusin the maximum amount of code.

There are three important players:

1. Views
2. Controllers
3. Services

### Views
- Only render logic should live in the views.
- Sends events to the controller using Sinks.
- Uses the Streams provided by the controller to render the updated info.

### Controllers
- Contain all the business logic that the views need to render.
- Communication happens though Sinks (in) and Streams (out).

### Services
- Contain the logic that can be reused by different controllers such as authentication, etc.