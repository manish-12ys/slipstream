# 09 — Permissions, Privacy and Security

## Default stance
Core launcher functionality should work without account creation, analytics, contacts access, calendar access, Usage Access or Accessibility Service.

## Permission inventory
| Capability | Permission/access | When to request |
|---|---|---|
| Set as Home | User-selected default Home role / HOME intent flow | During onboarding, with explanation |
| App discovery | Package visibility declarations | Only for launchable apps required by drawer |
| Wallpaper selection | System photo picker or Storage Access Framework | Only when user selects wallpaper |
| Android app widgets | AppWidgetManager/host binding flows | When user adds a widget |
| Usage insights | Usage Access special access | Only when user enables usage feature |
| Contacts search | Contacts permission | Only when user enables contacts search |
| Calendar search | Calendar permission | Only when user enables calendar search |
| Lock-screen action | Device Admin or other supported mechanism, if chosen | Only after explicit opt-in and policy review |
| Accessibility | Accessibility Service, if absolutely necessary | Avoid for v1; explicit explanation and opt-in |

## Privacy requirements
- No ads or trackers by default.
- No network requests required for home, drawer, notes or tasks.
- No collection of contacts, calendar, app usage or personal content without feature-specific consent.
- Keep sensitive data local unless a future sync feature is explicitly designed.
- Never log note text, contact data, calendar event text, app usage history or authentication secrets.
- Provide clear permission status and revoke/disable paths.
- Explain what stops working when a permission is revoked.
- Include a privacy policy before public release, matching actual behaviour.

## Security requirements
- Validate imported backup files and size limits.
- Avoid arbitrary deserialization of untrusted JSON.
- Use Android content URIs correctly; persist URI permissions when supported.
- Do not expose exported components unnecessarily.
- Protect platform channels from malformed arguments.
- Keep secrets out of source control.
- Use secure storage only if a real secret is introduced; do not store ordinary preferences in a secrets vault.

## Play policy review
Before release, review current Google Play policies for package visibility, Accessibility API, Device Admin, Usage Access, background execution and personal/sensitive data. Policy requirements change; do not rely on this document as legal advice.
