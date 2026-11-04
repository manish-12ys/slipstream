# 28 — Risk Register

| ID | Risk | Likelihood | Impact | Mitigation | Status |
|---|---|---|---|---|---|
| R-01 | Flutter/native widget embedding complexity | High | High | Prove AppWidgetHost spike before scope commitment | Open |
| R-02 | OEM launcher differences | High | High | Test AOSP/Pixel, Samsung and Xiaomi-class devices | Open |
| R-03 | Package visibility policy changes | Medium | High | Minimize queries; review current Play policy | Open |
| R-04 | Gesture conflict with system/widgets | High | High | Axis thresholds, edge deferral, device tests | Open |
| R-05 | Feature scope delays core launcher | High | High | P0-first gates; no parallel mega-implementation | Open |
| R-06 | Sensitive permissions increase policy burden | Medium | High | Avoid unless essential; explicit opt-in | Open |
| R-07 | Wallpaper URI permission revoked | Medium | Medium | Persist grants where supported; fallback | Open |
| R-08 | App uninstalled while drawer open | Medium | Medium | Handle package events and launch failures | Open |
| R-09 | Migration/restore data loss | Low/Med | High | Versioned migrations and validation tests | Open |
| R-10 | Racing IP infringement | Medium | High | Original assets; use licensed materials only | Open |
| R-11 | Blur/motion hurts low-end devices | Medium | Medium | Profile GPU/memory; reduced-effects mode | Open |

Review at sprint planning and beta. Add discovered risks with an owner and mitigation.
