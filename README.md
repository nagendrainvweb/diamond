# Diamond - Work Administration App

**Diamond** is an administration app designed for diamond industry workers to manage and track their work details and salary. The app allows workers to register, log in, and access essential features such as salary tracking and profile updates. Built using the **MVVM** architecture and **Provider** for state management, the app is designed to handle worker management efficiently.

## Table of Contents
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Architecture](#architecture)
- [State Management](#state-management)
- [Pages and Functionality](#pages-and-functionality)
- [Setup](#setup)
- [Contributors](#contributors)
- [License](#license)

---

## Features
- **User Authentication**: Secure login and registration for diamond workers.
- **Dashboard**: Displays company information and allows users to log in/out.
- **Salary Tracker**: Workers can view their monthly salary details based on their assigned jobs.
- **Profile Management**: Update personal details such as name, contact information, etc.
- **MVVM Architecture**: Ensures clear separation of logic and UI.
- **Provider for State Management**: Efficient and scalable state management.

---

## Technology Stack
- **Framework**: Flutter
- **Language**: Dart
- **Architecture**: Model-View-ViewModel (MVVM)
- **State Management**: Provider
- **Backend**: Firebase or custom REST API

---

## Architecture
The app follows the **MVVM (Model-View-ViewModel)** architecture to ensure scalability, maintainability, and ease of testing.

### Key Components:
- **Model**: Handles the app’s data, including retrieving and saving worker and salary information.
- **View**: Represents the UI elements such as Login, Register, Dashboard, and Salary Tracker screens.
- **ViewModel**: Acts as an intermediary between the Model and the View, managing the data flow and user interactions.

---

## State Management
The **Provider** package is used for state management, allowing for a reactive UI that updates based on changes in the data. Provider ensures efficient data handling, making the app responsive to user inputs and backend interactions.

---

## Pages and Functionality

1. **Login Page**
   - Workers can log in using their mobile numbers.
   - Simple and secure authentication mechanism.

2. **Register Page**
   - New workers can register using their email, mobile number, and password.
   - Basic validation ensures correct data input.

3. **Dashboard**
   - Displays company information and worker's status.
   - Options for logging in and out, along with a brief overview of recent activity.

4. **Salary Tracker**
   - Workers can view their salary details based on the jobs they have been assigned.
   - Salary is broken down monthly to give clear visibility into earnings.

5. **Profile Update**
   - Allows workers to update their personal information, such as name, email, and contact number.
   - Changes are saved to the backend in real time.

---

## Setup
Follow the steps below to set up and run the project locally:

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/diamond-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd diamond-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

Make sure to set up the Firebase or REST API backend for proper data handling and authentication services.

---

## Contributors
- **Nagendra Prajapati** - Lead Developer

---

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
