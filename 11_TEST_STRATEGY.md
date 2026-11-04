# 11 — Test Strategy

## Test pyramid

### Unit tests
- Gesture direction classifier and thresholds.
- App sorting and filtering.
- Space switching and persistence.
- Settings serialization.
- Repository error mapping.
- Database migrations.
- Backup validation.
- Clock format and locale behaviour.

### Widget tests
- Home shows only intended default elements.
- Clock respects theme and text scaling.
- Drawer search updates results.
- Empty and error states.
- Settings controls reflect persisted values.
- Widget dashboard layout controls.
- Accessibility labels and semantics.

### Integration tests
- Flutter/Kotlin platform API contract.
- Installed-app discovery.
- Launch intent invocation.
- Package add/remove refresh.
- HOME role selection and Home-key return.
- Native widget picker, bind, configure, render, resize and delete.
- Permission grant/revoke flows.
- Process recreation and data persistence.

### Manual device matrix
Test at minimum:
- One Pixel/AOSP-like device.
- One Samsung device.
- One Xiaomi/Redmi/POCO device if in target market.
- One low-memory device.
- Android versions covering the chosen minimum SDK through current target SDK.
- Different screen sizes, refresh rates and gesture navigation settings.

## Critical test scenarios
1. Set launcher as default, press Home, verify home screen.
2. Open another app, press Home, verify launcher resumes.
3. Swipe right/left/up from home.
4. Perform diagonal and short swipes; verify no accidental navigation.
5. Scroll inside an Android widget; verify page swipe does not steal its scroll.
6. Search app, tap result, verify correct app launches.
7. Uninstall app while drawer is open; no crash.
8. Revoke wallpaper URI access; graceful fallback.
9. Kill process and relaunch; restore stable state.
10. Add/configure/resize/remove an Android widget.
11. Revoke Usage Access; usage-based features degrade gracefully.
12. Enable TalkBack and navigate all primary destinations.
13. Increase system font/display size.
14. Test RTL locale and 12/24-hour clock.
15. Test dark mode and dynamic color unavailable fallback.

## Release gates
- No P0 defects.
- No crash in critical flows.
- `flutter analyze` passes.
- Unit, widget and integration tests pass.
- No unresolved high-severity privacy/security issue.
- Permission explanations and privacy policy match behaviour.
