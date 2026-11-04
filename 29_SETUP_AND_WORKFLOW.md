# 29 — Developer Setup and Workflow

## Prerequisites
Flutter stable, Dart, Android Studio/SDK, compatible Java/Kotlin/Gradle toolchain, emulator and physical Android device, Git.

## First-run commands
```bash
flutter doctor -v
flutter pub get
dart format .
flutter analyze
flutter test
flutter build apk --debug
flutter devices
flutter install
```

## Branching
Use `main` for stable builds and short-lived `feature/<ticket-id>-name` or `fix/<ticket-id>-name` branches. A solo developer can keep this lightweight.

## Merge checklist
- [ ] Ticket and user value stated.
- [ ] Scope focused and architecture boundaries respected.
- [ ] Tests added/updated and passing.
- [ ] Format and analysis pass.
- [ ] Device test performed for platform changes.
- [ ] Docs/changelog updated.
- [ ] No secrets or personal data committed.

See `30_DEFINITION_OF_DONE.md` for completion criteria.
