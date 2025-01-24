README 
iOS App to Display Australian Cities

Overview

This iOS app loads a list of Australian cities grouped by state, with collapsible sections for each state. 
The app also includes functionality to reverse the list order, supports dark mode, and incorporates key design principles such as SOLID and MVVM. 
Additionally, it implements unit testing, caching for performance optimization, and the ability to refresh data from a backend.

Features
Display Cities by State: The app will display a list of cities grouped by their respective states, with each state having a collapsible section.
Reverse List Order: A button allows the user to reverse the order of the list (either alphabetically or based on the city data).
Dark Mode Support: The app supports both light and dark modes, adapting automatically to system preferences.
Data Caching: Data is cached for offline usage and performance optimization. The app will only refresh data when necessary (e.g., based on a specified cache expiration or user request).
Backend Refresh: A refresh button allows the user to fetch the latest city data from the backend if available.
SOLID Design Principles: The app follows SOLID principles to ensure maintainability, scalability, and ease of testing.
MVVM Design Pattern: The app implements the MVVM (Model-View-ViewModel) design pattern for separation of concerns and cleaner code.
Unit Tests: The app includes unit tests for key logic, especially for the ViewModel and data handling components.

Architecture
MVVM Design Pattern

Model: Represents the city and state data. This includes a struct or class for City and State.
ViewModel: Handles the logic for data manipulation (sorting, filtering, etc.) and interacts with the model layer. It also communicates with the view to update UI components.
View: The UI, which is implemented using SwiftUI. It interacts with the ViewModel to update the UI.
SOLID Principles
Single Responsibility: Each class/struct in the project has a single responsibility (e.g., City represents city data, StateSection handles state-related data logic).
Open/Closed: The app is open for extension (e.g., new functionality like new sorting types) but closed for modification.
Liskov Substitution: Derived classes should be replaceable with their base classes without affecting correctness.
Interface Segregation: The app avoids large, monolithic interfaces. Each class or struct has its own focused interface.
Dependency Inversion: The app uses protocols to abstract dependencies, allowing for easier testing and future enhancements.
Setup & Installation
Clone the repository or download the zip file containing the app source code.
Open the project in Xcode.
Make sure you have Xcode 13.0 or later installed.
Build and run the project on your simulator or physical device.
Data Structure
The app expects a JSON file containing an array of cities, each with the following structure:

json
[
  {
    "city": "Sydney", 
    "lat": "-33.8678", 
    "lng": "151.2100", 
    "country": "Australia", 
    "iso2": "AU", 
    "admin_name": "New South Wales", 
    "capital": "admin", 
    "population": "4840600", 
    "population_proper": "4840600"
  }, 
  {
    "city": "Melbourne", 
    "lat": "-37.8142", 
    "lng": "144.9631", 
    "country": "Australia", 
    "iso2": "AU", 
    "admin_name": "Victoria", 
    "capital": "admin", 
    "population": "4529500", 
    "population_proper": "4529500"
  }
  ]
This data is used to generate a list of cities, grouped by state, in the app.

Features Walkthrough
Collapsible Sections by State
The cities are grouped by their states into collapsible sections.
Each state section is represented by a header that can be tapped to expand or collapse the list of cities under that state.

Reverse List Order
A button at the top of the screen allows the user to reverse the order of the cities.
Tapping the button will reverse the display order of the cities in the list (either from top-to-bottom or alphabetical order).
Dark Mode Support
The app supports dark mode, and the UI adjusts automatically based on the system theme.
Ensure the app adapts colors and UI elements appropriately in both light and dark modes.

Data Caching and Backend Refresh
When the app loads for the first time or when a refresh is triggered, it fetches the city data from a backend.
Data is cached locally using UserDefaults or a file-based caching system.
If data is outdated (based on your own criteria), the app will attempt to refresh the data from the backend.

Unit Testing
The app includes unit tests for the following components:
ViewModel: Ensures the ViewModel logic works correctly, such as sorting cities and handling state data.
Data Handling: Tests the logic related to fetching.
