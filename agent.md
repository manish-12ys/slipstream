# agent.md — Slipstream Launcher Master Instructions

You are the engineering agent for an Android-first Flutter launcher with native Kotlin integration. Read this file before coding.

## 1. Mandatory document map
Read `README.md` first. Consult the following files as relevant; all are part of the project source of truth:

| File | Required use |
|---|---|
| `01_PRODUCT_VISION.md` | Product and scope decisions |
| `02_FEATURE_SPEC.md` | Before feature implementation/change |
| `03_UX_NAVIGATION.md` | Screens, navigation, gestures and edge cases |
| `04_DESIGN_PHILOSOPHY.md` | Visual/UI work and racing-inspired language |
| `05_SYSTEM_ARCHITECTURE.md` | Cross-feature and architecture changes |
| `06_FLUTTER_ARCHITECTURE.md` | Flutter layers, state and routing |
| `07_ANDROID_NATIVE_BRIDGE.md` | Kotlin, launcher, packages, widgets and permissions |
| `08_DATA_MODEL.md` | Persistence and schema changes |
| `09_PERMISSIONS_PRIVACY.md` | Permissions and personal/sensitive data |
| `10_PERFORMANCE_RELIABILITY.md` | Lifecycle, performance and caching |
| `11_TEST_STRATEGY.md` | Test planning and completion |
| `12_IMPLEMENTATION_ROADMAP.md` | Phase scope |
| `13_BACKLOG.md` | Original high-level backlog |
| `14_AGENT.md` | Historical pointer; this root file is authoritative |
| `15_DECISIONS_LOG.md` | Architecture decision changes |
| `16_RELEASE_CHECKLIST.md` | Beta/release |
| `17_OPEN_QUESTIONS.md` | Unresolved product decisions |
| `18_IMPLEMENTATION_SEQUENCE.md` | **Exact mandatory implementation order** |
| `19_SPRINT_PLAN.md` | Sprint planning/review |
| `20_TASK_BACKLOG.md` | Detailed engineering tickets |
| `21_MASTER_TODO.md` | Master progress checklist; update continuously |
| `22_PROJECT_STATUS.md` | Milestone status and evidence |
| `23_API_CONTRACTS.md` | Flutter/Kotlin contracts |
| `24_DEPENDENCIES.md` | Package/tooling decisions |
| `25_VISUAL_MOCKUPS.md` | Screen concepts and visual reference |
| `26_REQUIREMENTS_TRACEABILITY.md` | Requirement-to-code/test mapping |
| `27_CHANGELOG.md` | Material project changes |
| `28_RISK_REGISTER.md` | Risks and mitigations |
| `29_SETUP_AND_WORKFLOW.md` | Developer setup and Git workflow |
| `30_DEFINITION_OF_DONE.md` | Ready/done quality gates |
| `FILE_TREE.md` | Target repository structure |
| `CONTENTS.md` | Documentation index |

### Document authority
Latest explicit product-owner decision wins. This root `agent.md` governs agent workflow. `18_IMPLEMENTATION_SEQUENCE.md` governs build order. Accepted architecture decisions and feature specifications govern implementation. If docs conflict, flag and update all affected docs; do not silently pick one.

## 2. Mandatory implementation order
Follow `18_IMPLEMENTATION_SEQUENCE.md` gates 0–12: repository audit; bootstrap; Android HOME identity; minimal home; gestures; native app discovery/launch; settings/theme; productivity; native widget proof; widget dashboard; spaces/groups; advanced features; release hardening. Do not skip gates. Never fake Android RemoteViews as Flutter widgets; prove AppWidgetHost integration first.

## 3. Product requirements that must not regress
- Default home shows only clock and wallpaper.
- Swipe right → launcher productivity widgets.
- Swipe left → Android app-widget dashboard.
- Swipe up → app drawer.
- Settings reachable from productivity page.
- App drawer uses real Android installed-app data; tapping launches through Android.
- Material 3/dynamic color with fallback.
- F1 personality is subtle, original and optional.
- No official F1/FIA/team/driver marks or likenesses without permission.
- Core launcher is local-first and works without network.

## 4. Architecture rules
Flutter owns UI/navigation/local product features. Kotlin owns Android launcher, package, widget and platform APIs. Domain imports neither Flutter UI nor Android classes. Screens never call raw channel methods. Use typed DTOs/error codes, one state framework, versioned migrations and tests. Keep feature-first modules; avoid giant files and speculative abstractions.

## 5. Android/policy rules
Verify APIs against actual SDK. Declare only required package visibility. Never silently change default Home role. Do not claim ordinary apps can force-stop apps or freely control system UI. Accessibility Service, Device Admin, Usage Access, contacts and calendar access need feature-specific justification and explicit consent; avoid Accessibility Service in v1. Android widgets are native AppWidgetHost/RemoteViews. Handle unsupported APIs and permission denial. Review current Play policy before release.

## 6. Design rules
Home is clock + wallpaper only. Natural wallpaper remains the hero. Dynamic Material You first; racing accents optional. Use Apex/Pit Wall/Grid/Carbon language sparingly. Jokes never obscure errors, privacy explanations or accessibility labels. Respect TalkBack, large text, contrast, reduced motion and system navigation.

## 7. Workflow for every task
1. Identify ticket ID and read relevant docs.
2. Inspect repository and existing implementation; never overwrite blindly.
3. State a short plan and assumptions.
4. Implement one smallest complete vertical slice.
5. Add/update tests.
6. Run `dart format`, `flutter analyze`, and relevant tests.
7. Build the APK and verify it by physically installing it on an Android phone if Android/platform code changed. An emulator and live Flutter device connection are not required.
8. Update `20_TASK_BACKLOG.md` and `21_MASTER_TODO.md`.
9. Update `22_PROJECT_STATUS.md` with evidence if milestone progress changed.
10. Update `27_CHANGELOG.md` for material changes.
11. Update ADR/API/data/design docs when contracts change.
12. Report changed files, tests, build results, device verification and limitations.

## 8. Physical-install verification checklist
The primary device workflow is manual installation on a real Android phone. Run `flutter build apk --debug` (or the appropriate release build), transfer the APK from `build\app\outputs\flutter-apk\` to the phone, install it from the phone's file manager or package installer, and test it manually. Do not require an emulator, `flutter devices`, USB debugging, `flutter install`, or `flutter run`.

For every launcher/platform change, check and record:

### Setup and identity
- [ ] The expected APK is built successfully and transferred to the phone.
- [ ] The APK installs, opens, updates over the previous build, and can be uninstalled cleanly.
- [ ] Slipstream appears as a selectable Home app.
- [ ] Selecting another launcher and switching back works.
- [ ] Pressing the physical or gesture-navigation Home action returns to Slipstream.
- [ ] Rebooting the phone preserves the selected default launcher behavior.

### Minimal home and appearance
- [ ] Home shows only the clock and wallpaper by default.
- [ ] Clock follows the device 12/24-hour setting and updates at a minute boundary.
- [ ] Wallpaper loads; the fallback background appears if wallpaper access fails.
- [ ] Light mode, dark mode, dynamic color, and fallback colors render correctly.
- [ ] Portrait, landscape, small display, large display, and display/font scaling remain usable.

### Gestures and navigation
- [ ] Swipe right opens the productivity page.
- [ ] Swipe left opens the Android widget page or its documented empty state.
- [ ] Swipe up opens the app drawer.
- [ ] Short, diagonal, slow, cancelled, and edge-origin swipes do not navigate accidentally.
- [ ] Back from the drawer returns to the previous stable page.
- [ ] Taps and scrolling inside interactive widgets are not stolen by page gestures.
- [ ] Gesture alternatives and labels are usable with TalkBack and reduced motion enabled.

### App drawer and native bridge
- [ ] Drawer lists real launchable apps from the phone, alphabetically.
- [ ] Search filters app labels locally and shows an empty state for no matches.
- [ ] Tapping an app opens the correct package.
- [ ] Disabled, uninstalled, or unavailable apps fail safely with a user-readable message.
- [ ] Adding, removing, disabling, and updating an app does not crash the launcher.
- [ ] Rotating the phone or backgrounding/foregrounding the app preserves stable state.
- [ ] Killing and relaunching the process restores the expected launcher state.

### Reliability, privacy, and evidence
- [ ] Airplane mode does not break core launcher behavior.
- [ ] No sensitive data, package errors, or stack traces appear in user-facing UI or logs.
- [ ] Permission denial and unsupported API paths show a clear explanation and recovery path.
- [ ] Capture Android version, device model, app version, test date, and pass/fail results.
- [ ] Do not mark a device-gated task Done until the physical-device checks pass.

## 9. Never
- Mark work Done because code was generated.
- Invent Android capabilities or permissions.
- Use mock installed-app data in production.
- Silently drop data in migrations.
- Log notes, contacts, calendar details or usage history.
- Add dependencies without reviewing `24_DEPENDENCIES.md`.
- Implement all features in one huge change.
- Claim tests/builds passed unless actually run.

## 10. Required completion report
Summarize user-visible behaviour, files changed, ticket IDs, commands/tests and results, device/API versions, limitations/risks and next recommended ticket.
