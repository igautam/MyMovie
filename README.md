# MyMovie

MyMovie will show the list of movies and its details.

MyMovie is a sample iOS App developed in order to utilize the public APIs for movies and display a list of all movies. 
User can view list of movies and also can view their movie details.

Use cases:

* To display list of all movies and show details once selected.

APIs integrated(Public APIs):
* "https://api.themoviedb.org/3/discover/movie

API Documentation details:
* https://developer.themoviedb.org/docs/getting-started

Project Architectural Details:

* This application is developed in SwiftUI.
* This application follows MVVMC architecture with Protocol Oriented Programming(POP).Navigation has been handeled with coordinator pattern.
* Coordinator is responsible for creation of view and view model and navigation is from one coordinator to another i.e from MovieCoordinator to MovieDetailCoordinator
* APIClientService is written to handle the network calls.
* Movie and MovieDetail module has different layers as per MVVMC architecture.
* Image caching done using iOS native caching mechanism.
* Data binding is done using native Combine framework using property observers.
* Module level API Service layer is also written in order to segregate the load and to introduce scope of test cases.
* Mock API service is also used to mock the success/ failure scenarios.
* Test cases are also written and executed.
* ViewModel is mockable because of protocol interface.
* ViewModel layer test cases are done with mock responses and mock errors.
* Mock MyMovie Test object is created in order to perform test scenarios.
* Added SwiftLint for coding style and conventions.

<img width="301" height="643" alt="Screenshot 2025-08-21 at 4 57 27 PM" src="https://github.com/user-attachments/assets/8404bc54-08ad-4903-936a-debc866f68a1" />

<img width="301" height="649" alt="Screenshot 2025-08-21 at 4 58 08 PM" src="https://github.com/user-attachments/assets/e5de65a4-de77-4536-84ae-d81178166456" />


