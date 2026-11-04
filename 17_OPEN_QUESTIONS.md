# 17 — Open Questions and Assumptions

The project can begin with the defaults below. Confirm these before the first public release.

| Decision | Proposed default | Why it matters |
|---|---|---|
| Final app name | Slipstream (working codename only) | Branding, package and store listing |
| Minimum Android version | Choose after checking APIs/devices; Android 10+ is a possible starting point | Compatibility and launcher APIs |
| State management | Riverpod | Consistency |
| Database | Drift/SQLite | Structured local data |
| Native bridge | Pigeon | Typed Flutter/Kotlin contract |
| App drawer layout | Grid first, list optional | Initial UX scope |
| Clock | Large digital clock, date optional | Minimal home identity |
| Wallpaper | System wallpaper by default, optional custom wallpaper | Permissions and UX |
| Double tap | Leave unassigned until a reliable supported action is selected | Avoid promising restricted lock action |
| Spaces | P1, not required for first usable build | Scope control |
| Android widgets | P1 after native proof of concept | Technical complexity |
| Analytics | None in v1 | Privacy-first |
| Cloud sync | None in v1 | Local-first scope |
| Racing accents | Optional presets, dynamic color default | Keep product original and adaptable |

## Decisions required from product owner
1. Confirm the final name and package namespace.
2. Confirm minimum Android version and target device range.
3. Choose preferred app drawer default: grid or list.
4. Decide whether the home clock should be digital only or offer analog styles later.
5. Decide whether the default wallpaper follows system wallpaper or is managed independently.
6. Decide whether a radial wheel is desired in v1 or a later release.
7. Decide whether F1-inspired accent presets should be enabled by default or remain optional.

Do not block Phase 1 on questions that can safely use the proposed defaults.
