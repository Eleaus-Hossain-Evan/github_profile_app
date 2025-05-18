# GitHub Profile App

This Flutter application allows users to search for GitHub profiles and view their details, repositories, and other relevant information.

## How to Run

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Eleaus-Hossain-Evan/github_profile_app
    cd github_profile_app
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run code generation (for Riverpod providers):**
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

4.  **Run the app:**
    Connect an emulator or a physical device and run:
    ```bash
    flutter run --dart-define GITHUB_USER=Eleaus-Hossain-Evan
    ```

5.  **Build APK for a specific GitHub User (Required):**
    To build a release APK targeting a specific GitHub user, you can use the `--dart-define` flag. For example, to build for the user `Eleaus-Hossain-Evan`:
    ```bash
    flutter build apk --release --dart-define GITHUB_USER=Eleaus-Hossain-Evan
    ```
    The APK will be located in `build\app\outputs\flutter-apk\app-release.apk`.

 ### Setup VSCode debug settings

To debug the app using VSCode, you can add the following configuration to your `.vscode\launch.json` file:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "github_profile_app",
      "request": "launch",
      "type": "dart",
      "toolArgs": ["--dart-define", "GITHUB_USER=Eleaus-Hossain-Evan"]
    },
    {
      "name": "github_profile_app (profile mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "profile",
      "toolArgs": ["--dart-define", "GITHUB_USER=Eleaus-Hossain-Evan"]
    },
    {
      "name": "github_profile_app (release mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "release",
      "toolArgs": ["--dart-define", "GITHUB_USER=Eleaus-Hossain-Evan"]
    }
  ]
}
```
then simply run the run through VSCode.


## Technologies Used

- **Flutter**: For building a cross-platform mobile application from a single codebase.
- **Dart**: The programming language used for Flutter development.
- **Riverpod**: For state management, leveraging `hooks_riverpod` and code generation (`@riverpod` annotations) for robust and maintainable state.
- **Flutter Hooks**: For managing local widget state efficiently and declaratively.
- **Dio**: For making HTTP requests to the GitHub API.
- **GoRouter**: For declarative routing and navigation within the app.
- **flutter_animate**: For creating engaging animations and visual effects.
- **Equatable**: For easy value equality comparisons in data models.

## Project Structure

This project follows a feature-first architecture:

```
lib/
├── features/                # Feature-based organization
│   ├── feature_name/        # Each feature is self-contained
│   │   ├── presentation/    # Screens, Widgets
│   │   ├── application/     # Controllers/Providers - (business logic)
│   │   ├── domain/          # Entities, Repositories(Interface, Abstract classes)
│   │   └── data/            # Repositories(implement), Data Sources, DTOs
├── core/                    # Shared core functionality (router, remote, theme, etc.)
├── shared/                  # Shared components across features
└── main.dart
```

