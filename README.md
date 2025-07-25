A GitHub repository Link:


Overview
This app allows users to:

Search universities by country or university name using the public Hipolabs Universities API.

View detailed information about each university, including the national flag and website.

Display a mock user profile with a user icon and name.

Navigate between screens smoothly with declarative routing.

Instructions for Launching the App:Clone The GitHub Repo & Launch In Android Device Or Android Emulator (flutter run)

                    Tech stack

Language	Dart
Framework	Flutter
Architecture	MVVM (Model-View-ViewModel)
State Management	Riverpod (flutter_riverpod)
Routing	GoRouter
API	Hipolabs Universities API
Country Flags	country_flagspackage
Networking	httppackage
UI Components	Flutter Widgets + Google Fonts
URL Launcher	url_launcher
Additional UI	flutter_typeaheadfor autocomplete
Code Quality	MVVM + Service Layer Separation


                     Folder structure


lib/
│
├── main.dart                # Entry point of the app
├── models/                  # Data models (e.g., university.dart)
├── services/                # Login Sheet For Student Name & Url Launcher
├── viewmodels/              # Riverpod providers and business logic
├── views/                   # Screens (Home, Detail, UserProfile)
├── widgets/                 # Reusable UI components and widgets
├── routing/                 # GoRouter configurations and route setup                     




                      Setup Instructions



Ensure your machine has Flutter SDK version >= 3.0.0 installed.

All network calls use HTTPS for secure communication.

Add required permissions:

Android: Internet permission in AndroidManifest.xml

No backend setup is required since APIs are public.


                 Security and Error Handling Considerations


All API calls are made over HTTPS to ensure encrypted communication.

Network failures, invalid inputs, and API errors are handled gracefully:

Show Snackbars with user-friendly error messages.

Provide loading indicators and retry mechanisms.

Input validation is applied on user search queries to prevent empty or malformed requests.

Profile data is mock and hardcoded; no sensitive user data is stored or transmitted.

Dependencies are carefully chosen with active maintenance to avoid vulnerabilities.

Navigation is handled via GoRouter supporting declarative and safe routing.

URL launches use url_launcher with LaunchMode.externalApplication to open links securely in the default browser.