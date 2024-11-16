# Dijkstra’s Algorithm based Pathfinding Application 

## Overview
Developed an interactive city navigation app utilizing Dijkstra’s Algorithm to compute the shortest path between cities based on real-world geographic data. The application provides a user-friendly interface for selecting cities and visualizing the shortest path, enhancing the usability of pathfinding algorithms. 
## Technology Stack
- **Frontend**: Flutter
- **Backend**: Node.js with MongoDB
- **Development Tools**: Android Studio, Visual Studio Code, GitHub
## Features
- Shortest Path Calculation: Uses Dijkstra’s Algorithm for optimal route selection between cities.
- Interactive UI: Built with Flutter to offer an intuitive, mobile-friendly interface.
- Backend Integration: Powered by a robust Node.js backend and MongoDB database to store and query city connections and distances.
- Real-Time Updates: Reflects changes dynamically, ensuring accurate path calculations.
- Visual Map Representation: Displays cities and paths on an interactive map for better visualization.
# Installation
## Prerequisites
- Node.js installed
- Flutter SDK installed
- MongoDB setup locally or on the cloud

## Backend Setup
Clone the repository:
```
git clone https://github.com/your-username/dijkstra-pathfinding.git
cd dijkstra-pathfinding/backend
```
Install dependencies:
```
npm install
```
Start the backend:
```
npm start
```
## Frontend Setup
Navigate to the frontend folder:
```
cd ../frontend
```
Install dependencies:
```
flutter pub get
```
Run the app:
```
flutter run
```
## Usage
1. Launch the app on an emulator or physical device.
2. Select the starting city and destination city from the dropdown menus.
3. View the calculated shortest path along with intermediate cities on the map.
4. Interact with the map for a zoomable, detailed view.
