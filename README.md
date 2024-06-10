# PlayStation 5 - Game List

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that lists games available for
PlayStation 5.

### Prerequisites

Make sure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [melos](https://melos.invertase.dev/getting-started)

### Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/your-username/playstation-5-game-list.git
    cd playstation-5-game-list
    ```

2. **Install dependencies:**

    ```sh
    melos get
    ```

3. **Build the project:**

    ```sh
    melos build
    ```

4. **Generate localization files:**

    ```sh
    melos generate-locale
    ```

5. **Run the application:**

    ```sh
    flutter run
    ```

### Project Structure

```
lib/
├── common/
├── core/
│   ├── exception/
│   └── design_system/
├── features/
│   ├── home/
│   │   ├── data/
│   │   │   └── remote/
│   │   ├── domain/
│   │   └── presentation/
│   └── splash/
├── generated/
```

### Features

- [x] List of PlayStation 5 games
- [x] Game details view
- [ ] Search functionality

### Code Coverage

![code-coverage-report.png](docs/code-coverage-report.png)
You can view the code coverage report [here](docs/coverage_report/index.html).