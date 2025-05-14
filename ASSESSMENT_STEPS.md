# Flutter Application Development: Assessment Steps

This document outlines the key steps for developing the Flutter GitHub Profile application.

## Phase 1: Project Setup & Core Structure

1.  **Initialize Flutter Project**: Create a new Flutter project.
2.  **Add Dependencies**: Include necessary packages in `pubspec.yaml` (e.g., `hooks_riverpod`, `flutter_hooks`, `dio`, `go_router`, `shared_preferences`, `flutter_animate`, `equatable`).
3.  **Run `flutter pub get`**: Fetch all dependencies.
4.  **Establish Folder Structure**: Create the feature-first directory layout (`core/`, `features/`, `main.dart`).
5.  **Configure `main.dart`**: Set up basic app structure, theme, and initial GoRouter configuration.
6.  **Set up Riverpod**: Initialize `ProviderScope` at the root of the application.
7.  **Code Generation Setup**: Ensure `build_runner` is configured for Riverpod code generation.

## Phase 2: Feature Implementation - Profile Screen

1.  **Define Domain Layer** (`features/profile/domain/`):
    - Create `UserProfile` entity (immutable, with `Equatable`).
    - Define `ProfileRepository` interface.
2.  **Implement Data Layer** (`features/profile/data/`):
    - Create `ProfileRemoteDataSource` (using Dio to fetch from GitHub API).
    - Implement `ProfileRepositoryImpl` (fetches data from data source, maps to `UserProfile` entity).
3.  **Develop Application Layer** (`features/profile/application/`):
    - Create `ProfileController` (AsyncNotifier using `@riverpod`) to manage state for fetching user profile.
4.  **Build Presentation Layer** (`features/profile/presentation/`):
    - Create `ProfileScreen` (HookConsumerWidget).
    - Display user information (avatar, name, bio, followers, following, etc.).
    - Handle loading and error states using `AsyncValue` from the controller.
    - Implement basic UI elements and styling.

## Phase 3: Feature Implementation - Repositories List Screen

1.  **Define Domain Layer** (`features/repositories/domain/`):
    - Create `Repository` entity (immutable, with `Equatable`).
    - Define `RepositoriesRepository` interface.
2.  **Implement Data Layer** (`features/repositories/data/`):
    - Create `RepositoriesRemoteDataSource` (using Dio to fetch user's repositories from GitHub API).
    - Implement `RepositoriesRepositoryImpl`.
3.  **Develop Application Layer** (`features/repositories/application/`):
    - Create `RepositoriesController` (AsyncNotifier using `@riverpod`) for fetching and managing the list of repositories.
4.  **Build Presentation Layer** (`features/repositories/presentation/`):
    - Create `RepositoriesListScreen` (HookConsumerWidget).
    - Display a list of repositories (name, description, stars, forks).
    - Implement pagination or infinite scrolling if required.
    - Handle loading, empty, and error states.
    - Navigate to `RepositoryDetailScreen` on item tap.

## Phase 4: Feature Implementation - Repository Detail Screen

1.  **Define Domain Layer** (`features/repository_detail/domain/`):
    - Reuse `Repository` entity if applicable or create a more detailed one.
    - Define `RepositoryDetailRepository` interface (e.g., to fetch README or specific commit history).
2.  **Implement Data Layer** (`features/repository_detail/data/`):
    - Create `RepositoryDetailRemoteDataSource`.
    - Implement `RepositoryDetailRepositoryImpl`.
3.  **Develop Application Layer** (`features/repository_detail/application/`):
    - Create `RepositoryDetailController` (AsyncNotifier using `@riverpod`) for fetching detailed repository information.
4.  **Build Presentation Layer** (`features/repository_detail/presentation/`):
    - Create `RepositoryDetailScreen` (HookConsumerWidget).
    - Display detailed information about the selected repository (e.g., README content, last commit, branches, link to GitHub).
    - Handle loading and error states.

## Phase 5: Routing & Navigation

1.  **Configure GoRouter** (`core/router/`):
    - Define routes for `ProfileScreen`, `RepositoriesListScreen`, and `RepositoryDetailScreen`.
    - Handle route parameters (e.g., `username`, `repositoryName`).
    - Implement navigation logic between screens.

## Phase 6: Shared Components & Utilities

1.  **Develop Shared Widgets** (`shared/presentation/widgets/`):
    - Create reusable UI components (e.g., custom app bar, loading indicators, error messages).
2.  **Implement Core Utilities** (`core/utils/`):
    - Create helper functions, constants, or extensions.
3.  **Theme Configuration** (`core/theme/`):
    - Define app-wide themes (light/dark mode).

## Phase 7: State Management & Data Flow

1.  **Riverpod Providers**: Ensure all providers are correctly defined using `@riverpod` and code generation (`dart run build_runner build --delete-conflicting-outputs`).
2.  **Flutter Hooks**: Utilize `useState`, `useEffect`, `useMemoized` etc., for local widget state within `HookConsumerWidget`s.
3.  **Data Flow**: Verify data flows correctly from data sources -> repositories -> controllers -> UI.
4.  **Error Handling**: Implement robust error handling using `AsyncValue` and display user-friendly error messages.

## Phase 8: Testing

1.  **Unit Tests**: Write unit tests for domain models, repository implementations, and controllers.
2.  **Widget Tests**: Write widget tests for screens and shared widgets.
3.  **Integration Tests**: (Optional) Write integration tests for key user flows.

## Phase 9: Finalization & Submission

1.  **Code Review & Refactoring**: Clean up code, ensure adherence to guidelines, and optimize performance.
2.  **Linting & Formatting**: Run `dart analyze` and `dart format .`.
3.  **Build Release Version**: Generate APK/IPA.
4.  **Documentation**: Update `README.md` and any other relevant documentation.
5.  **Prepare Submission**: Zip the project folder (excluding `build/`, `.dart_tool/`, `.idea/`, `*.iml`, `*.xcworkspace`, `ios/Pods/`, `ios/Flutter/ephemeral/`, `macos/Flutter/ephemeral/`, `windows/flutter/ephemeral/`).

This checklist provides a structured approach to completing the Flutter application. Each step should be addressed systematically.
