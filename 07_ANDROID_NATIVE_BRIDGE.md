# 07 — Android Native Integration

## Why a native layer is required
A Flutter app can draw launcher UI, but Android launcher functionality is governed by Android APIs. Do not simulate native launcher capabilities with fake data.

## Default Home app
- Register an activity that handles `android.intent.action.MAIN` plus `android.intent.category.HOME` and `android.intent.category.DEFAULT`.
- Verify behaviour on supported Android versions and OEM launchers.
- Provide a clear user path to choose the app as default Home app.
- Use the appropriate role/request flow where supported; never silently change the user's default launcher.
- Test returning Home from other apps, reboot, app update and process recreation.

## Installed app discovery
- Use `PackageManager` and launcher activities to enumerate launchable applications.
- Respect Android package visibility requirements and declare only the necessary `<queries>` or permissions.
- Do not request broad package visibility without a documented reason and Play policy review.
- Convert native results to DTOs: package name, label, icon representation/handle, launchability and optional activity component.
- Treat package name as stable identity; labels and icons can change.
- Listen for package add/remove/change events and refresh cache safely.
- Handle work profile, suspended, disabled, archived and unavailable apps gracefully.

## Launching apps
- Launch through the package's resolved launch intent.
- Handle missing activity, package uninstall race, disabled app and security exception.
- Do not crash if an app disappears between display and tap.
- Use Android-supported app shortcuts only where the target app exposes them.

## App widgets (RemoteViews)
Android app widgets are not Flutter widgets.
- Use `AppWidgetManager`, `AppWidgetHost`, `AppWidgetProviderInfo` and `RemoteViews`.
- Allocate and persist widget IDs.
- Launch provider configuration activity when required.
- Bind the widget ID to the provider.
- Host native widget views in an Android `View` container.
- Expose a carefully designed Flutter/native embedding boundary.
- Persist widget ID, provider component, size, position and page.
- Delete widget IDs when removed.
- Handle provider app uninstall/update and widget restore.
- Respect resize modes, min dimensions, update periods and provider limitations.

Prototype strategy: ship v1 without third-party Android widgets if the native host integration cannot be made reliable. Do not present Flutter-built cards as if they were Android widgets.

## Usage statistics
If recent/most-used sorting or usage insights are added:
- Explain why Usage Access is needed.
- Send user to system Usage Access settings.
- Verify access after returning.
- Do not assume permission was granted.
- Store only the minimum derived information needed.
- Do not upload usage history.

## System actions and limitations
- Lock screen: may be possible through Device Admin or supported accessibility-based approaches, but requires explicit user opt-in and policy review. Do not assume a normal app can lock the device freely.
- Recents: launching the system Recents UI is restricted and OEM-dependent.
- Power menu, notification shade and Quick Settings: do not promise unrestricted control.
- Force stop: not available to ordinary third-party launchers.
- Notification access: separate sensitive permission; do not request unless a real feature requires it.
- Accessibility Service: never use as a general workaround. If used, document purpose, request explicit enablement and comply with Play policies.

## Platform API contract
Keep method names and DTOs in a single documented API definition. Every method must define:
- Request schema.
- Success response.
- Expected error codes.
- Android API availability.
- Permission/role requirement.
- Lifecycle behaviour.
