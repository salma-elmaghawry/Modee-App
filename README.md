# Moddee-App

A Flutter e-commerce sample app (internal project "markatty"). This README gives setup instructions, the API endpoints used, a short folder structure overview, why Cubit is used for state management, and small demo screenshots.

## Setup

- Prerequisites: Flutter SDK (>= 3.0), Git, and an editor (VS Code or Android Studio).
- Install dependencies:

```pwsh
flutter pub get
```

- Run the app (connect a device or emulator):

```pwsh
flutter run
```

If you need to clear generated files and rebuild:

```pwsh
flutter clean
flutter pub get
flutter run
```

## API Endpoints Used

This project uses a fake store API for demo data. See `lib/Core/Networking/api_constants.dart`.

- Base URL: `https://fakestoreapi.com`
- Categories endpoint: `/products/categories`
- Products endpoint: `/products`

The networking layer lives in `lib/Core/Networking/api_service.dart` (wraps Dio, adds timeouts and maps errors into `ApiException`). Repositories call the ApiService and translate responses into models.

## Folder structure (short explanation)

- `lib/`
	- `main.dart` — app entrypoint
	- `modee_app.dart` — root widget and routing
	- `Core/` — shared core code
		- `Networking/` — API service and constants
		- `Theme/` — color and text style helpers
		- `di/` — dependency injection (GetIt)
	- `Features/` — feature-based module layout
		- `Home/` — home screen, product list, repositories, cubits
		- `Cart/` — cart UI and cubit/logic
		- ... other features are grouped similarly

This feature-based layout keeps feature code together (UI, state, data) which simplifies scaling the project.

## State management: Why Cubit

- Simplicity: Cubit (from the bloc package) provides a minimal and predictable way to manage state with less boilerplate than full Bloc setup.
- Testability: Cubits are easy to unit test — they are plain classes that emit states.
- Observable states: UI subscribes to state changes via `BlocBuilder`/`BlocListener` which keeps presentation separated from business logic.

In this project, each feature (e.g., products, categories, cart) exposes a Cubit that handles requests and emits `Loading`, `Loaded`, and `Error` states. Repositories abstract the networking and return models.

## Error handling

- Networking uses `Dio` wrapped by `ApiService`. Timeouts and network errors are mapped to `ApiException` with helpful messages (e.g., "No Internet connection" or "Request timed out").
- UI reads error states and shows readable messages (and a retry action where appropriate).

## Demo images

Below are screenshots from the app. They are referenced from the `assets/images/` folder. If they are not present, add them there.

Cart view 1:

![cart1](assets/images/cart1.png)

Cart view 2:

![cart2](assets/images/cart2.png)

Home demo:

![home1](assets/images/home1.png)

Home demo 2:

![home2](assets/images/home2.png)

Full demo:

![demo](assets/images/demo.png)

---

If you want, I can also add unit tests for the networking layer to validate ApiException mapping and add a small CONTRIBUTING or developer notes file. Let me know which you'd prefer next.
