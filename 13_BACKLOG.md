# 13 — Engineering Backlog

Use IDs in commits and pull requests where practical. Keep each task independently testable.

## Epic A — Bootstrap
- [ ] A-01 Create Flutter project and Android application module.
- [ ] A-02 Choose package ID, min SDK and target SDK.
- [ ] A-03 Configure Material 3 theme and fallback palette.
- [ ] A-04 Add linting, formatting and test commands.
- [ ] A-05 Add typed Flutter/Kotlin bridge.
- [ ] A-06 Add CI build and test workflow.

## Epic B — Launcher role and home
- [ ] B-01 Add HOME intent filter.
- [ ] B-02 Implement default Home selection guidance.
- [ ] B-03 Build wallpaper background layer.
- [ ] B-04 Build clock component.
- [ ] B-05 Add system time format and locale handling.
- [ ] B-06 Add home page state.
- [ ] B-07 Add process restoration.

## Epic C — Gestures
- [ ] C-01 Implement gesture intent classifier.
- [ ] C-02 Add horizontal page navigation.
- [ ] C-03 Add swipe-up drawer navigation.
- [ ] C-04 Define edge/system gesture handling.
- [ ] C-05 Add gesture tests for diagonal and short movements.
- [ ] C-06 Add accessibility navigation alternatives.

## Epic D — App drawer
- [ ] D-01 Implement native installed-app query.
- [ ] D-02 Define typed app DTO.
- [ ] D-03 Build app list/grid.
- [ ] D-04 Implement local search.
- [ ] D-05 Implement app launch.
- [ ] D-06 Handle package change events.
- [ ] D-07 Add app icon caching and invalidation.
- [ ] D-08 Add empty, loading and error states.

## Epic E — Settings and design system
- [ ] E-01 Build settings navigation.
- [ ] E-02 Add dynamic color integration.
- [ ] E-03 Add system/light/dark modes.
- [ ] E-04 Add accent presets.
- [ ] E-05 Add clock customization.
- [ ] E-06 Add reduced motion and contrast options.

## Epic F — Productivity widgets
- [ ] F-01 Add local database.
- [ ] F-02 Implement notes CRUD.
- [ ] F-03 Implement tasks CRUD and completion.
- [ ] F-04 Build productivity dashboard.
- [ ] F-05 Add card ordering.
- [ ] F-06 Add event countdown.
- [ ] F-07 Add habit tracking and history.

## Epic G — Android widgets
- [ ] G-01 Build native AppWidgetHost proof of concept.
- [ ] G-02 Enumerate widget providers.
- [ ] G-03 Bind and configure widget.
- [ ] G-04 Embed native view in Flutter composition.
- [ ] G-05 Persist widget IDs and placements.
- [ ] G-06 Resize and delete widget.
- [ ] G-07 Test provider uninstall/update and process death.

## Epic H — Spaces and advanced
- [ ] H-01 Implement Space entity and migration.
- [ ] H-02 Add create/rename/delete space.
- [ ] H-03 Add space switching.
- [ ] H-04 Add per-space wallpaper.
- [ ] H-05 Add app groups.
- [ ] H-06 Add radial menu prototype.
- [ ] H-07 Add focus session prototype.

## Definition of done
A task is done only when:
- Code follows architecture boundaries.
- Relevant tests exist and pass.
- Loading, empty, error and permission states are considered.
- Accessibility semantics are present for interactive UI.
- Documentation is updated if API, schema or behaviour changed.
- No secrets, personal content or debug-only data are committed.
