# Monopoly Tour

Monopoly Tour is a SwiftUI, iOS application that gamifies the exploration of the iconic Monopoly board locations throughout London. The app allows a user to track their visited locations, view their completion progress and navigate themselves to real-world locations as seen in the board game.

## App Preview
![screen-record](https://github.com/user-attachments/assets/79c135fe-3a3c-4ab4-b6c4-c931809df82e)


## 📱 Features

### Core Functionality
- **Location Tracking:**  Mark 27 iconic London locations as `visited`/`unvisited`
- **Progress Monitoring:**  Track completion progress overall and by colour sets
- **Interactive Map:**  View all locations on a map with custom pins
- **Smart Filtering:**  Filter locations by their colour set and visited status
- **Navigation Integration:**  Get walking directions to any location through iOS maps app
- **Persistent Storage:**  Your progress automatically saves as you mark locations
### User Experience
- **Tab based Navigation:**  `Home`, `Places` and `Map` tabs
- **Colour-coded Organisation:**  Locations are grouped by their respective colour sets as seen in Monopoly
- **Progress Visualisation:**  Easy to understand with circular progress indicators, linear progress bars and completion stats
- **Responsive Design:**  Optimised to work on all iPhone sizes
- **Dark Mode Support:**  Automatically adapts to light/dark mode based on user's device settings.

## 🔨 Architecture

This project uses `MVVM` and demonstrates **Clean Architecture** principles with a focus on testability and maintainability.

### Architecture Layers
`| SwiftUI Views |`  <  Presentation layer
`| ViewModels    |`  <  Business logic layer
`| Repository    |`  <  Data access layer
`| Storage       |`  <  Persistence layer
### Key Patterns
- **MVVM:**  Clean separation between views and business logic
- **Repository Pattern:**  Centralised data access with abstract interface
- **Dependency Injection:**  Flexible, testable component assembly
- **Protocol-Oriented Programming:**  Interface-based design for flexibility
  
## 🔧 Technologies and Frameworks
- **SwiftUI:**  Modern declarative UI framework
- **MapKit:**  Interactive maps and location services
- **Combine:**  Reactive programming for data binding
- **Swift Testing:**  Modern testing framework
- **UserDefaults:**  Local data persistence

## 🚀 Getting Started

### Installation
1. Clone the repository
`git clone git@github.com:kzxxm/monopoly-tour-ios.git`

2. Navigate to project directory
`cd monopoly-tour-ios`

3. Open in Xcode
`open Monopoly\ Tour.xcodeproj`

4. Select device/simulator then build + run the project 
`cmd+R`

## 📁 Project Structure

```
Monopoly Tour/ 
│                          
├─ Constants/                            # Constant values (colors/layouts)
│
├─ Dependency/                           
│  └─ AppDependencies.swift              # Dependency injection setup
│
├─ Model/                                
│  ├─ ColorSet.swift                     # Color set definitions
│  └─ Location.swift                     # Location data model
│
├─ Repository/                           
│  ├─ LocationRepository.swift           # Data access implementation
│  └─ LocationRepositoryProtocol.swift   
│
├─ Storage/                              
│  ├─ LocationStorage.swift              # UserDefaults implementation
│  └─ LocationStorageProtocol.swift      
│
├─ View/                                 
│  ├─ Components/                        # Reusable UI components
│  ├─ Home/                              
│  │  ├─ HomeView.swift                  # Main dashboard
│  │  └─ SetView.swift                   # List of locations for a color set
│  ├─ Map/                               
│  │  └─ MapView.swift                   # Interactive map
│  ├─ Places/                            
│  │  └─ PlacesView.swift                # List of locations
│  │
│  ├─ ContentView.swift                  # Contains tab switcher and main views
│  ├─ FilterSheetView.swift              # Reusable sheet for filtering locations
│  └─ LocationView.swift                 # Location details screen
│
└─ ViewModel/                            
   ├─ ColorSetViewModel.swift            # Home screen business logic
   ├─ LocationFilters.swift              # Filtering logic
   └─ PositionViewModel.swift            # Location detail logic
```

## 🧪 Testing

This project includes comprehensive test coverage using **Swift Testing**.

To run all the tests, use `cmd+U` in Xcode.
For specific tests, find the file and run the test suite or the individual test.

### Test Architecture
```
Monopoly Tour Tests/
│
├─ Mocks/
│  ├─ MockLocationRepository.swift
│  └─ MockLocationRepositoryStorage.swift
│
├─ Repository/                                
│  └─ LocationRepositoryTests.swift
│
├─ Storage/                                
│  └─ LocationStorageTests.swift
│
└─ ViewModel/
   ├─ ColorSetViewModelTests.swift
   ├─ LocationFiltersTests.swift
   └─ PositionViewModelTests.swift
```

## 📍 Locations

The app includes all 26 locations from the London Monopoly board, plus a bonus location for jail.

###  Sets
- **Brown:** Old Kent Road, Whitechapel Road
- **Light Blue:** The Angel Islington, Euston Road, Pentonville Road
- **Pink:** Pall Mall, Whitehall, Northumberland Avenue
- **Orange:** Bow Street, Marlborough Street, Vine Street
- **Red:** Strand, Fleet Street, Trafalgar Square
- **Yellow:** Leicester Square, Coventry Street, Piccadilly
- **Green:** Regent Street, Oxford Street, Bond Street
- **Blue:** Park Lane, Mayfair
- **Stations:** Fenchurch Street, Liverpool Street, Marylebone, King's Cross
- **Jail:** Tower of London

## 🤝 Contributing

This is a personal learning project, but feedback and suggestions are welcome!
