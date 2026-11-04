# 08 — Data Model

## Storage strategy
Use SQLite (for example through Drift) for structured, relational data. Use preferences for small scalar settings. Store no user content in logs.

## Core entities

### LauncherSettings
- `id`
- `themeMode` (`system`, `light`, `dark`)
- `dynamicColorEnabled`
- `accentPreset` (nullable)
- `clockFormat` (`system`, `12h`, `24h`)
- `clockAlignment`
- `defaultHomePage`
- `gestureConfigurationJson` or normalized gesture rows
- `createdAt`, `updatedAt`

### Space
- `id` (UUID)
- `name`
- `sortOrder`
- `wallpaperMode`
- `wallpaperUri` (nullable)
- `themeOverride` (nullable)
- `isDefault`
- `createdAt`, `updatedAt`

### AppGroup
- `id`
- `spaceId`
- `name`
- `presentation` (`list`, `grid`, optional `circle`)
- `sortOrder`

### AppGroupItem
- `id`
- `groupId`
- `packageName`
- `sortOrder`

### HiddenApp
- `packageName`
- `createdAt`

### Note
- `id`
- `title`
- `body`
- `sortOrder`
- `createdAt`, `updatedAt`

### Task
- `id`
- `title`
- `isCompleted`
- `dueAt` (nullable)
- `sortOrder`
- `createdAt`, `updatedAt`

### Habit (later)
- `id`
- `name`
- `colorToken`
- `createdAt`

### HabitCheckIn (later)
- `id`
- `habitId`
- `localDate`
- `completedAt`

### LauncherWidgetPlacement
- `id`
- `spaceId` or dashboard page ID
- `widgetType`
- `providerComponent` (nullable for built-in widgets)
- `appWidgetId` (nullable; native ID)
- `position`
- `spanX`, `spanY`
- `configurationJson` (versioned)

## Identity and integrity
- Use UUIDs for launcher-owned records.
- Use Android package name as app identity; do not use app label as a key.
- Add foreign keys and cascade rules intentionally.
- Avoid storing icon bitmaps in the main relational tables; use a cache keyed by package/version.
- Do not assume app widget IDs survive app data clearing; reconcile with Android host state.

## Migrations
- Every schema change increments database version.
- Include forward migration tests.
- Never silently discard user data.
- Backup format must include schema version and be validated before import.
- Unknown newer backup versions must be rejected safely with a helpful message.

## Backup
v1: local export/import only, if implemented.
- Export user settings, spaces, groups, notes and tasks.
- Do not export Android widget IDs as if portable; widget providers may need to be rebound.
- Do not include app usage data.
- Encrypt backup if it contains sensitive user content, or clearly warn before creating an unencrypted file.
