# 06 — Flutter Architecture

## Recommended stack
Choose stable package versions at project bootstrap and pin them in `pubspec.lock`. Do not blindly copy version numbers from this document.

Suggested choices:
- Flutter stable channel.
- Dart null safety.
- Material 3 (`useMaterial3: true`).
- `go_router` or a small declarative router for navigation.
- Riverpod or another single state-management approach. Do not mix multiple state frameworks without a reason.
- Drift/SQLite for relational local data; SharedPreferences only for small preferences.
- Pigeon for typed Flutter/Kotlin APIs where practical.
- `dynamic_color` package for Android dynamic color extraction, with fallback scheme.

## Feature-first structure
Each feature may contain:
- `data/`: data sources and repository implementations.
- `domain/`: entities, repository contracts and use cases.
- `presentation/`: screens, widgets, controllers/providers.

Small features may omit unnecessary layers, but keep platform access out of UI widgets.

## State boundaries
- `HomeState`: active page, clock configuration, wallpaper state.
- `AppDrawerState`: query, sort mode, app list load state.
- `SpacesState`: current space and available spaces.
- `WidgetDashboardState`: layout and widget metadata.
- `SettingsState`: persisted preferences and permission status.
- Platform streams: app installed/removed/updated events.

Avoid a single global state object containing every feature.

## Routing
Use a small set of top-level destinations:
- Home shell with horizontal page state.
- App drawer as a dedicated route or controlled overlay.
- Settings as a route.
- App details / picker / edit flows as nested routes or sheets.

Back handling must be tested with Android predictive back. Avoid custom back interception unless needed.

## Theme system
1. Read dynamic color when supported and enabled.
2. Build a Material 3 `ColorScheme`.
3. Apply optional user accent override only when explicitly selected.
4. Provide stable fallback light/dark schemes.
5. Persist theme mode and accent preference.
6. Respect system dark mode by default.

## Clock
- Render time from device locale/time zone.
- Respect 12/24-hour system setting unless user overrides it.
- Update on minute boundary; do not run a high-frequency timer unnecessarily.
- Handle time zone, locale and daylight-saving changes.
- Use tabular numerals if the selected font supports them.

## Error and loading UI
- No permanent spinner for app discovery.
- Keep last known app list while refreshing.
- Explain missing permissions in plain language.
- Provide retry action for recoverable errors.
- Avoid showing raw exception text to users.

## Code quality
- `flutter analyze` must pass.
- Format with `dart format`.
- Use immutable state where practical.
- Keep widgets small and focused.
- Avoid business logic inside `build()`.
- Add keys to important interactive widgets for tests.
