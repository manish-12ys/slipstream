# 21 — Master To-Do Checklist

Only check an item after it works on a device and relevant tests pass.

## Product decisions
- [ ] Final name and package namespace.
- [ ] Minimum Android version and target devices.
- [ ] Default drawer grid/list choice.
- [ ] Clock/date defaults.
- [ ] Wallpaper source default.
- [ ] Radial menu release scope.

## Foundation and launcher
- Progress: Flutter/Kotlin bootstrap, HOME intent, minimal home, gesture navigation, native app discovery/launch, package-change refresh, and app drawer are implemented. Physical installation/testing is still required before device-gated items are checked.
- [x] Repository audited; SDK versions recorded.
- [ ] Debug build installs. (APK build passes; manual phone installation pending.)
- [ ] Default Home selection works.
- [ ] Wallpaper + clock home. (Implemented; physical verification pending.)
- [ ] Right/left/up gestures. (Implemented and automated tests pass; physical verification pending.)
- [ ] Gesture conflicts and accessibility alternatives.

## App drawer
- [ ] Native installed-app discovery. (Implemented; physical verification pending.)
- [ ] App labels/icons and alphabetical order. (Implemented; physical verification pending.)
- [ ] Search and launch. (Implemented and automated tests pass; physical verification pending.)
- [ ] Package change refresh. (Implemented; physical verification pending.)
- [ ] Empty/error/uninstalled-app handling.

## Visual system
- [ ] Material 3 and dynamic color.
- [ ] Fallback, light/dark/system themes.
- [ ] Racing accent presets.
- [ ] Clock and wallpaper customization.
- [ ] Reduced motion, TalkBack and large text.

## Productivity and widgets
- [ ] Notes and tasks.
- [ ] Reorderable productivity cards.
- [ ] Native AppWidgetHost proof.
- [ ] Provider picker, bind, render, touch, resize, delete, restore.

## Advanced
- [ ] Spaces and per-space settings.
- [ ] Groups/folders.
- [ ] Radial favourites.
- [ ] Focus and launch pause.
- [ ] Usage insights and permission flow.
- [ ] Backup/restore.

## Release
- [ ] Unit/widget/integration tests.
- [ ] OEM/device matrix.
- [ ] Performance and accessibility audit.
- [ ] Privacy and Play policy review.
- [ ] Store assets, beta and release candidate.
