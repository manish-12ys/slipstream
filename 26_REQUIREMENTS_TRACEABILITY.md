# 26 — Requirements Traceability

| Requirement | Spec | Implementation | Verification |
|---|---|---|---|
| Clock + wallpaper | HOME-01/02 | `features/home` | Home widget/integration test |
| Swipe right productivity | NAV-01 | home/productivity | Gesture integration test |
| Swipe left Android widgets | NAV-02 | android_widgets | Native widget test |
| Swipe up drawer | NAV-03 | app_drawer | Gesture test |
| Real installed apps | APP-01 | Kotlin packages adapter | Package discovery test |
| Launch app | APP-02 | Kotlin launch adapter | Device integration test |
| Dynamic color | Appearance | app/theme | Theme tests |
| Notes/tasks | WID-01/02 | productivity | Repository/UI tests |
| Spaces | SPACE-01 | spaces | Persistence/switching tests |
| Native widgets | AW-01..05 | Kotlin widgets + Flutter page | Widget host matrix |
| Focus session | FOCUS-01 | focus | Unit/UI tests |
| Privacy by default | Privacy doc | permission adapters | Permission review |

Add a row for every accepted new requirement. No requirement is complete until verification is identified.
