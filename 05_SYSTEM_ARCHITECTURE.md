# 05 — System Architecture

## Architectural style
Use a **modular, feature-first Flutter application** with clean boundaries and a native Android platform layer.

Flutter owns:
- Launcher screens and visual composition.
- Navigation and gesture intent.
- Settings and local product features.
- App drawer presentation and search UI.
- Notes, tasks, habits and spaces data.
- Theme system and design tokens.

Android/Kotlin owns or mediates:
- HOME intent and default launcher integration.
- Installed application discovery and launch intents.
- Package visibility and package-change events.
- Native AppWidgetHost and AppWidgetManager integration.
- Platform permissions and role checks.
- Usage statistics access, if included.
- System actions that Android exposes through supported APIs.

## Logical architecture

```text
┌──────────────────────────────────────────────┐
│                  Flutter UI                  │
│ Home | Drawer | Search | Widgets | Settings  │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│             Presentation / State             │
│ ViewModels or feature controllers, routing   │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│                  Domain                      │
│ Use cases, entities, repository contracts    │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│                   Data                       │
│ Repositories, local DB, preferences, cache   │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│             Platform Adapters                │
│ Method/Event Channels or Pigeon APIs         │
└──────────────────────┬───────────────────────┘
                       │
┌──────────────────────▼───────────────────────┐
│              Android / Kotlin                │
│ PackageManager | AppWidgetHost | Roles       │
└──────────────────────────────────────────────┘
```

## Dependency rule
- UI depends on feature presentation logic.
- Presentation depends on domain use cases.
- Domain defines repository interfaces and does not import Flutter or Android APIs.
- Data implements domain interfaces.
- Platform adapters translate Android data into stable app-level models.
- No screen directly invokes arbitrary MethodChannel strings.
- No domain entity contains Android `Context`, `Activity`, `Intent`, `RemoteViews` or Flutter widget types.

## Communication
Prefer a typed platform API. Pigeon is a suitable option for generating type-safe Flutter/Kotlin bindings; a carefully wrapped MethodChannel is acceptable for a small prototype. Use EventChannel or a typed event stream for package-change events.

Define versioned DTOs for cross-platform messages. Handle unavailable platform capabilities explicitly.

## Data ownership
- Preferences: simple user settings.
- Local database: spaces, notes, tasks, groups, widget metadata and ordering.
- Android widget IDs: owned by Android AppWidgetHost; persist mapping to app records.
- Installed apps: source of truth is Android PackageManager; local cache is disposable.
- Wallpaper: source of truth depends on selected wallpaper mode; store URI/permission state safely.

## Failure boundaries
A platform feature may be unavailable or permission denied without crashing the launcher. Return typed results such as `unsupported`, `permissionRequired`, `notFound`, `temporarilyUnavailable` and `failure`.

## Architecture quality goals
- Feature modules can be tested independently.
- Native integration can be tested without rendering the full Flutter UI.
- Persistent data has explicit migrations.
- Platform messages are typed and documented.
- No hidden network dependency for core launcher functionality.
