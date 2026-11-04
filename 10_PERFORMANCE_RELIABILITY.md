# 10 — Performance and Reliability

## Performance goals
Treat these as initial engineering targets; measure on real low-, mid- and high-tier devices.
- Home screen should appear quickly after returning Home.
- Avoid network calls on the critical home path.
- Keep clock updates to minute boundaries unless seconds are explicitly enabled.
- App drawer should show cached results promptly and refresh asynchronously.
- Avoid decoding every app icon at full resolution at once.
- Use lazy lists/grids and bounded image caches.
- Avoid unnecessary blur, shader and large opacity layers on low-end GPUs.

## Initial budgets (validate experimentally)
- Home UI first usable frame: target under 500 ms from warm process resume.
- App drawer cached first content: target under 300 ms after route transition.
- No sustained main-thread work over a frame budget during scrolling.
- 60 fps target on supported 60 Hz devices; higher refresh rates should remain smooth.
- No unbounded memory growth while repeatedly opening/closing drawer and widget pages.

## Lifecycle
Handle:
- `resumed`, `inactive`, `paused`, `detached`.
- Activity recreation and configuration changes.
- Process death while launcher is backgrounded.
- Device reboot.
- Wallpaper URI permission loss.
- Package add/remove/update.
- Widget provider removal/update.
- Database migration failure.

## Reliability rules
- Platform calls have timeout/error handling where appropriate.
- Do not block initial home rendering while loading app list.
- Keep a last-known-good app list cache.
- If widget hosting fails, show a recoverable placeholder and keep other launcher pages usable.
- If a database migration fails, do not overwrite the original database.
- If a wallpaper URI becomes invalid, fall back to system wallpaper or a safe default.
- Prevent duplicate widget IDs and duplicate package rows.

## Observability
For development builds:
- Use structured, privacy-safe logs.
- Include feature and error code, not user content.
- Add performance traces around home render, app query, icon decode and widget host.
- Disable verbose logging in release.
