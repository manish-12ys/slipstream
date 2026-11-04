# Slipstream Launcher — Project Blueprint

> Working codename. Final product name, package ID, and visual identity are intentionally configurable.
> Tagline: **Your phone. Your pace. Your rules.**

## What this project is
An Android-first launcher built with Flutter and a small native Android/Kotlin integration layer. It combines a quiet, wallpaper-first home screen with fast app discovery, useful widgets, flexible spaces, and a cheeky Formula 1-inspired personality.

This is an original product inspired by racing culture, not an F1, FIA, team, or driver product. Do not use official team logos, driver likenesses, protected marks, or copied team liveries without permission.

## Product promise
- The default home screen shows only the clock and wallpaper.
- Swipe right opens the launcher’s own productivity widgets.
- Swipe left opens the Android app-widget dashboard.
- Swipe up opens the app drawer.
- A deliberate settings entry is available from the widgets area.
- Material You / dynamic color is the default visual foundation.
- Racing references appear in names, microcopy, motion, and optional accent themes—not as clutter.

## Documentation map
| File | Purpose |
|---|---|
| `01_PRODUCT_VISION.md` | Product vision, audience, goals, non-goals |
| `02_FEATURE_SPEC.md` | Feature inventory and functional requirements |
| `03_UX_NAVIGATION.md` | Screens, gestures, navigation and edge cases |
| `04_DESIGN_PHILOSOPHY.md` | Visual language, F1-inspired personality, accessibility |
| `05_SYSTEM_ARCHITECTURE.md` | High-level architecture and boundaries |
| `06_FLUTTER_ARCHITECTURE.md` | Flutter layers, state, routing and dependency rules |
| `07_ANDROID_NATIVE_BRIDGE.md` | Android launcher integration and platform constraints |
| `08_DATA_MODEL.md` | Entities, persistence and migrations |
| `09_PERMISSIONS_PRIVACY.md` | Permissions, privacy and security |
| `10_PERFORMANCE_RELIABILITY.md` | Performance budgets, lifecycle and failure handling |
| `11_TEST_STRATEGY.md` | Unit, widget, integration and device testing |
| `12_IMPLEMENTATION_ROADMAP.md` | Phases, milestones and acceptance criteria |
| `13_BACKLOG.md` | Prioritized implementation tasks |
| `14_AGENT.md` | Operating instructions for coding agents |
| `15_DECISIONS_LOG.md` | Architecture decision records |
| `16_RELEASE_CHECKLIST.md` | QA, release and store-readiness checklist |
| `17_OPEN_QUESTIONS.md` | Decisions to make before implementation |
| `FILE_TREE.md` | Suggested repository structure |

## Suggested first milestone
Build a reliable launcher shell before advanced features:
1. Android app can be selected as the default Home app.
2. Home screen displays wallpaper and clock only.
3. Swipe-up opens a real installed-app drawer.
4. Tapping an app launches it.
5. Swipe right and left navigate to placeholder widget pages.
6. Dynamic color and basic settings work.
7. Gesture conflicts, process recreation, and empty/error states are tested.

## Important technical truth
Flutter is suitable for the launcher UI, but Android launcher responsibilities require native platform integration. Installed-app discovery, launch intents, default-home role, app shortcuts, package visibility, usage access, and Android widgets have platform-specific APIs and restrictions. Native Android widgets are not ordinary Flutter widgets; displaying/interacting with them requires a native hosting strategy and careful lifecycle handling.

Do not promise unsupported system actions. For example, locking the screen, opening Recents, controlling notification shade, or force-closing apps may require special permissions, accessibility services, device-owner privileges, or may be restricted by Android version and OEM.


## Expanded operations pack
- `18_IMPLEMENTATION_SEQUENCE.md` — exact gate-by-gate implementation order.
- `19_SPRINT_PLAN.md` — suggested sprint sequence.
- `20_TASK_BACKLOG.md` — detailed engineering tickets.
- `21_MASTER_TODO.md` — master checklist.
- `22_PROJECT_STATUS.md` — milestone status and evidence.
- `23_API_CONTRACTS.md` — Flutter/Kotlin contracts.
- `24_DEPENDENCIES.md` — packages and tooling.
- `25_VISUAL_MOCKUPS.md` — screen concepts and generated mockup reference.
- `26_REQUIREMENTS_TRACEABILITY.md` — requirement-to-test mapping.
- `27_CHANGELOG.md` — project changes.
- `28_RISK_REGISTER.md` — risks and mitigations.
- `29_SETUP_AND_WORKFLOW.md` — developer workflow.
- `30_DEFINITION_OF_DONE.md` — quality gates.

Start with `agent.md`, then execute `18_IMPLEMENTATION_SEQUENCE.md` in order. Track work in `20_TASK_BACKLOG.md` and `21_MASTER_TODO.md`; record evidence in `22_PROJECT_STATUS.md` and changes in `27_CHANGELOG.md`.


## Visual mockups
The latest phone-screen concept is included at `assets/mockups/slipstream_launcher_screen_concepts.png`. It illustrates Home, Our Widgets, Android App Widgets, App Drawer, Spaces, Focus Mode, gesture navigation and optional racing-inspired themes. It is a visual reference, not a screenshot of a working app. See `assets/mockups/README.md`.

## Recommended first action
Open `agent.md`, then follow `18_IMPLEMENTATION_SEQUENCE.md` from Gate 0. Use `21_MASTER_TODO.md` to track work, `22_PROJECT_STATUS.md` to record evidence, and `27_CHANGELOG.md` to record material changes.
