# Le Revenu – Home Page (Flutter Technical Test)

## Overview
A mobile home page for Le Revenu, built with Flutter, inspired by the editorial identity of lerevenu.com. All content is fake/hardcoded data as instructed — no API calls.

## Tech stack
- Flutter (stable channel), Material 3
- No external state management package — used built-in `StatefulWidget` + `setState`, since the scope (tab selection, category filter) didn't justify the added complexity of Provider/Riverpod/Bloc for a test project

## Architecture
lib/
main.dart              # App entry point, theme configuration
models/                # Plain data classes (Article, Section)
data/                  # Fake/mock data source
screens/               # Full-page widgets (HomeScreen)
widgets/                # Small, reusable presentational widgets

I separated models, fake data, screens, and widgets into distinct folders to keep each file responsible for one thing, and to make it easy to later swap `FakeData` for a real API layer without touching any UI code.

## Key decisions
- **Reusable widgets**: `ArticleCard`, `SectionChipList`, and `BreakingNewsBanner` are all stateless and driven entirely by the data passed into them, so they can be reused anywhere and are easy to test/preview in isolation.
- **State ownership**: `HomeScreen` is the single source of truth for UI state (selected tab, selected category filter). Child widgets are "dumb" — they render based on props and report user actions back up via callbacks, rather than managing their own state. This keeps state predictable and easy to trace.
- **Category filtering**: tapping a category chip filters the article list live using the selected category, giving the categories real functional purpose rather than being purely decorative.
- **Performance**: used `const` constructors wherever possible to avoid unnecessary widget rebuilds.

## What I'd add with more time
- Local asset images instead of network-loaded placeholders
- Pull-to-refresh
- Article detail page on tap
- Unit/widget tests for the filtering logic

## Running the project
flutter pub get
flutter run