# 🛒 Modee-App

A Flutter e-commerce sample application .  
This README includes 🚀 setup instructions, 🔌 API usage, 📁 folder structure, 🎯 why Cubit, and 🖼️ demo preview images .

---

## ⚙️ Setup Instructions

> ✅ Requirements: **Flutter SDK (>=3.0), Git, Emulator or Physical Device**

```bash
flutter pub get
flutter run

```

- Run the app (connect a device or emulator):

If you need to clear generated files and rebuild:

```pwsh
flutter clean
flutter pub get
flutter run
```

## 🌐 API Endpoints Used

This project uses a fake store API for demo data. See `lib/Core/Networking/api_constants.dart`.

- Base URL: `https://fakestoreapi.com`
- Categories endpoint: `/products/categories`
- Products endpoint: `/products`

The networking layer lives in `lib/Core/Networking/api_service.dart` (wraps Dio, adds timeouts and maps errors into `ApiException`). Repositories call the ApiService and translate responses into models.

## 📁 Folder Structure Overview
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

## ⚡ State management: Why Cubit

- ✅ Simplicity: Cubit (from the bloc package) provides a minimal and predictable way to manage state with less boilerplate than full Bloc setup.
- ✅ Testability: Cubits are easy to unit test — they are plain classes that emit states.
- ✅ Observable states: UI subscribes to state changes via `BlocBuilder`/`BlocListener` which keeps presentation separated from business logic.

In this project, each feature (e.g., products, categories, cart) exposes a Cubit that handles requests and emits `Loading`, `Loaded`, and `Error` states. Repositories abstract the networking and return models.

## 🚨 Error handling

- Networking uses `Dio` wrapped by `ApiService`. Timeouts and network errors are mapped to `ApiException` with helpful messages (e.g., "No Internet connection" or "Request timed out").
- UI reads error states and shows readable messages (and a retry action where appropriate).

🛍️ UI Preview — Demo Screens

Full demo:

https://github.com/user-attachments/assets/91317f4b-1209-4698-b1c8-ad36f15d8e3b

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/498dd5e1-6028-4b3b-b4eb-2ce1589bf908" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/5d392cdb-40d9-43c5-8cf8-f0e9b368b9cd" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/2cb39976-0d0f-407d-a8ef-bcfd47df067d" width="200"/></td>
    <td><img src="https://github.com/user-attachments/assets/f75aa537-195a-4978-9338-e41d1bb0add2" width="200"/></td>
  </tr>
</table>



---

