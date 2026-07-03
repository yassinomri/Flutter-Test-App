# Le Revenu – Home Page (Flutter Technical Test)

## 📱 Overview
A mobile home page for Le Revenu, built with Flutter, inspired by the editorial identity of [lerevenu.com](https://www.lerevenu.com). All content utilizes static/mock data as instructed — no external API calls are made.

---

## 🛠️ Tech Stack
*   **Framework:** Flutter (Stable Channel)
*   **UI Guidelines:** Material 3
*   **State Management:** Built-in `StatefulWidget` + `setState`. Given the limited scope of the test (tab selection and category filtering), external state management packages like Provider, Riverpod, or BLoC were deliberately omitted to avoid unnecessary architectural overhead.

---

## 📐 Architecture

The project structure follows a clean separation of concerns, ensuring each file has a single responsibility and making it straightforward to swap the static data layer for a live API in the future without modifying UI components:

lib/
├── main.dart            # App entry point & theme configuration
├── models/              # Plain data classes (e.g., Article, Section)
├── data/                # Static/mock data source
├── screens/             # Full-page layout widgets (HomeScreen)
└── widgets/             # Reusable, atomic presentational widgets

---

## 💡 Key Decisions & Design Patterns

*   **Reusable Atomic Widgets:** Components like `ArticleCard`, `SectionChipList`, and `BreakingNewsBanner` are completely stateless. They are driven strictly by the properties passed into them, making them easy to test, maintain, and preview in isolation.
*   **Unidirectional Data Flow & State Ownership:** `HomeScreen` acts as the single source of truth for the UI state (active tab, active category filter). Child widgets are "dumb" components that render data based on props and bubble user actions back up using callbacks.
*   **Functional Filtering:** Tapping a category chip dynamically filters the visible article list in real-time, giving the UI interactive functionality rather than being purely decorative.
*   **Performance Optimization:** Aggressive use of `const` constructors across the widget tree to minimize unnecessary rebuilds and ensure smooth 60fps scrolling.

---

## 🚀 Future Roadmap (With More Time)
*   [ ] Integrate local asset images to replace network-loaded placeholders.
*   [ ] Implement native pull-to-refresh (`RefreshIndicator`).
*   [ ] Add a detailed view transition when tapping on an article card.
*   [ ] Write unit and widget tests targeting the category filtering logic.
