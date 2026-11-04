# 18 — Exact Implementation Sequence

Follow these gates in order. Do not start a later gate until the prior gate's exit criteria are met.

## Gate 0 — Repository reconnaissance
1. Inspect the existing repository; do not overwrite existing work.
2. Record Flutter, Dart, Gradle, Android Gradle Plugin, Kotlin, Java and SDK versions.
3. Run the existing build/tests and record baseline failures.
4. Confirm app ID, display name, min SDK and target device range.
**Exit:** baseline is reproducible or existing failures are documented.

## Gate 1 — Bootstrap
1. Create/verify Flutter Android project and Kotlin host.
2. Configure package namespace, app label, Material 3 and fallback theme.
3. Add formatting, linting, tests, CI and typed platform bridge skeleton.
4. Create only the feature directories needed for upcoming work.
**Exit:** debug build installs and opens on a physical device.

## Gate 2 — Android launcher identity
1. Register `MAIN` + `HOME` + `DEFAULT` intent filters.
2. Implement a user-driven default Home selection flow.
3. Test choosing Slipstream and switching back to another launcher.
4. Test Home-key return, reboot and process recreation.
**Exit:** Android recognises the app as a real Home launcher.

## Gate 3 — Minimal home
1. Build full-screen home shell and wallpaper layer.
2. Add locale-aware clock and system 12/24-hour format.
3. Add optional date/clock settings without cluttering default home.
4. Verify default home has only clock and wallpaper.
5. Test TalkBack, large text and screen sizes.
**Exit:** stable, minimal home on device.

## Gate 4 — Gestures and navigation
1. Implement gesture intent classifier separate from UI.
2. Right swipe → productivity page; left swipe → Android widgets page; up swipe → app drawer.
3. Define distance, velocity and axis-dominance thresholds.
4. Prevent widget scroll/tap gestures from being stolen; defer system edge gestures.
5. Add accessibility alternatives and tests for diagonal, short, edge and cancelled swipes.
**Exit:** all three gestures work without accidental navigation.

## Gate 5 — Native app discovery and launch
1. Query launchable apps with Android `PackageManager`.
2. Define typed DTOs and stable error codes.
3. Declare only required package visibility.
4. Cache metadata and handle package add/remove/change events.
5. Build drawer, alphabetical sort, local search and app launch.
6. Handle disabled/uninstalled apps and missing launch intents.
**Exit:** real apps list, search and launch reliably on target devices.

## Gate 6 — Settings and visual system
1. Build settings shell.
2. Add system/light/dark modes and dynamic color where supported.
3. Add fallback schemes and optional original racing accent presets.
4. Add wallpaper, clock and drawer settings.
5. Persist settings; test restart and accessibility options.
**Exit:** settings persist and theme behaves correctly across devices.

## Gate 7 — Productivity page
1. Build dashboard shell and settings entry.
2. Add local database and migrations.
3. Implement Notes CRUD, then Tasks CRUD/completion.
4. Add reorderable cards and empty/error states.
5. Add event countdown/habits only after core cards pass tests.
**Exit:** offline productivity features persist correctly.

## Gate 8 — Native widget proof of concept
1. Build Kotlin proof using `AppWidgetManager`, `AppWidgetHost`, provider info and `RemoteViews`.
2. Enumerate, allocate, bind and configure one widget.
3. Render in a native Android view and test touch interaction.
4. Test resize, provider update/uninstall and process recreation.
5. Decide and document Flutter/native embedding approach.
**Exit:** real native widget works reliably. If not, defer this feature; do not fake it with Flutter cards.

## Gate 9 — Android widget dashboard
1. Add provider picker and native binding flow.
2. Embed native widget views.
3. Persist widget IDs, provider components and placements.
4. Support removal, supported resizing and restoration.
5. Test widget touches against page gestures.
**Exit:** user can add, interact with, remove and restore real Android widgets.

## Gate 10 — Spaces and organization
1. Add Space schema and migration.
2. Create, rename, switch and delete spaces with safe default-space rules.
3. Store per-space wallpaper/layout.
4. Add App Groups and list/grid folders.
5. Add scheduled switching only after manual switching is stable.
**Exit:** spaces and groups persist and remain isolated.

## Gate 11 — Advanced features
Implement one at a time behind flags: radial favourites; supported app shortcuts; focus timer; launch pause; usage insights (explicit Usage Access); contacts/calendar search (explicit permissions); versioned backup/restore.
**Exit:** each feature has tests, privacy rationale and permission-denied handling.

## Gate 12 — Release hardening
Run full tests, profile performance, test OEM/device matrix, accessibility and policy review, verify privacy disclosures, prepare beta/store assets, fix P0/P1 defects and tag release.
**Exit:** release checklist complete with known limitations documented.

At every gate update `21_MASTER_TODO.md`, `22_PROJECT_STATUS.md`, `27_CHANGELOG.md`; update ADR/API/data docs when contracts change.
