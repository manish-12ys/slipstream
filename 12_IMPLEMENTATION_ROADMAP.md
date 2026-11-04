# 12 — Implementation Roadmap

Build in vertical slices. Every phase must produce a runnable application.

## Phase 0 — Project foundation
Deliverables:
- Flutter Android project.
- Kotlin Android host.
- Package ID and app name selected.
- Formatting, linting and CI baseline.
- Documentation and architecture decisions accepted.

Exit criteria:
- Debug build installs on a physical Android device.
- Flutter/Kotlin bridge smoke test passes.

## Phase 1 — Real launcher shell (P0)
Tasks:
1. Register HOME intent filter.
2. Verify launcher selection flow.
3. Build minimal wallpaper home.
4. Add clock with locale/12–24 hour support.
5. Add page navigation and gesture classifier.
6. Build placeholder productivity and Android widget pages.
7. Add app drawer with PackageManager-backed app list.
8. Implement app launch and local search.
9. Add settings shell and Material 3 theme.
10. Test Home-key return and process recreation.

Exit criteria:
- Usable daily launcher with the core three gestures.
- No fake app data in production path.

## Phase 2 — Design system and customization
- Dynamic color.
- Dark/light/system theme.
- Clock alignment and style.
- Wallpaper picker and fallback.
- Accent presets.
- Reduced-motion support.
- App drawer grid/list options.

## Phase 3 — Productivity features
- Notes.
- Tasks.
- Built-in widget cards.
- Reordering and local persistence.
- Event countdown.
- Habit tracker only after data model and UX are validated.

## Phase 4 — Native Android widgets
- Widget provider picker.
- Native AppWidgetHost integration.
- Configuration and binding.
- Native view embedding.
- Resize, delete and restore.
- Device/OEM compatibility testing.

Do not start this phase until a technical spike proves that native widgets can be embedded and interacted with reliably in the chosen Flutter architecture.

## Phase 5 — Spaces and app organization
- Multiple spaces.
- Per-space layout and wallpaper.
- App groups.
- Folder/grid presentation.
- Space switching and optional schedules.

## Phase 6 — Advanced capabilities
- Global search expansion.
- Usage insights with explicit Usage Access.
- Focus timer and optional app launch pause.
- Radial favourite-app wheel.
- Supported shortcuts and gesture customization.

## Phase 7 — Polish and release
- Performance profiling.
- Accessibility audit.
- OEM/device matrix.
- Backup/restore validation.
- Privacy policy and Play policy review.
- Store listing, screenshots and support documentation.

## Scope control
Do not build every Phi-inspired feature at once. The first release should be excellent at home, drawer, gestures, wallpaper and clock. Add advanced features only when the core launcher is stable.
