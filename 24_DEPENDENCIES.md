# 24 — Dependencies and Tooling Plan

Select current stable versions at bootstrap and record exact resolved versions in lockfiles. Do not blindly copy stale version numbers.

| Need | Candidate | Rule |
|---|---|---|
| UI | Flutter Material 3 | Core UI toolkit |
| Dynamic color | `dynamic_color` | Fallback required |
| State | Riverpod | Use one state approach consistently |
| Routing | `go_router` | Or simple router if justified |
| Database | Drift + SQLite | Structured local data |
| Preferences | SharedPreferences | Small scalar preferences only |
| Platform bridge | Pigeon | Typed Dart/Kotlin API |
| Tests | flutter_test, integration_test | Unit/widget/device flows |

Android APIs: PackageManager, HOME intent/role, AppWidgetManager, AppWidgetHost, RemoteViews. UsageStatsManager only if explicit Usage Access feature is approved.

Tools: Flutter stable, Android Studio, Android SDK, emulator, physical devices, Git, CI, `dart format`, `flutter analyze`, `flutter test`.

Before adding/upgrading a dependency, review maintenance, licence, security advisories, Android compatibility and permissions. Avoid duplicate libraries and broad-permission packages.
