Name: Mekdelawit kassahun
section 2
ID: UGR/7097/15


# Album List

A Flutter application that displays a list of albums and their photos using the JSONPlaceholder API. The app demonstrates clean architecture, state management, and modern Flutter theming.

## Features
- Fetches and displays albums from the JSONPlaceholder API
- Shows album details and the first photo for each album
- Pulls photos for each album and displays details on a separate screen
- Error handling and loading indicators
- Modern Material 3 design with a purple color scheme
- Responsive and scrollable UI

## Architecture
- **MVVM**: Separation of data, business logic, and presentation layers
- **Bloc**: State management for albums and photos
- **Retrofit**: For API calls with automatic serialization
- **GoRouter**: For screen navigation

## Getting Started
1. **Install dependencies:**
   ```bash
   flutter pub get
   ```
2. **Generate code:**
   ```bash
   flutter pub run build_runner build
   ```
3. **Run the app (Chrome):**
   ```bash
   flutter run -d chrome
   ```
   Or use your preferred device/emulator.

## Project Structure
- `lib/data/models/` - Data models for Album and Photo
- `lib/data/datasources/` - API service using Retrofit for network requests
- `lib/data/repositories/` - Repository for data operations
- `lib/business_logic/bloc/` - Bloc for state management
- `lib/presentation/screens/` - UI screens for album list and details
- `lib/main.dart` - App entry point and theme setup

## Theming
- Uses Material 3 with a deep purple color scheme
- Consistent styling for AppBar, buttons, cards, and loading indicators

## API
- [JSONPlaceholder](https://jsonplaceholder.typicode.com/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](LICENSE)

