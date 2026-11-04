# 03 — UX, Screens and Navigation

## Navigation model

```text
                    [Productivity Widgets]
                           ^ swipe right
                           |
[App Widgets] <--- [Minimal Home] ---> [Productivity Widgets]
 swipe left              |
                         | swipe up
                         v
                    [App Drawer]
                         |
                    [Search / App]
                         |
                      [Settings]
```

The home screen has a horizontal page model. Avoid treating the left and right pages as independent activities; use one coordinated pager or equivalent navigation state so gesture transitions remain consistent.

## Screen definitions

### 1. Home
- Full-bleed wallpaper.
- Large clock, optionally date.
- No default dock, app icons, search bar or persistent buttons.
- Tap clock may open clock customization only if the interaction is discoverable.
- Long press opens a lightweight home customization sheet.
- Accessibility semantics announce clock and available navigation hints.

### 2. Productivity Widgets (swipe right)
- Notes, tasks, habits and event cards as features are implemented.
- Settings affordance visible in the page header or a restrained corner control.
- Empty state: “Nothing on the pit wall yet.”
- Widgets can be reordered; avoid dense dashboard defaults.

### 3. Android App Widgets (swipe left)
- Hosts real Android app widgets.
- Add button opens system/provider widget picker.
- Explain that widget appearance and behaviour are controlled by the widget provider.
- Empty state: “No widgets on the grid. Add one from the widget picker.”

### 4. App Drawer (swipe up)
- Search field at top.
- Alphabetical app list/grid.
- Scrollable list, predictable back gesture.
- Long press opens supported app actions.
- Empty search state and no-app state must be handled.
- Do not show disabled/system components as launchable apps unless explicitly intended.

### 5. Settings
Sections:
- Appearance
- Home screen
- Gestures
- App drawer
- Spaces
- Widgets
- Focus
- Privacy and permissions
- Backup and restore
- About

## Gesture contract

| Gesture | Default action | Notes |
|---|---|---|
| Swipe up from home | App drawer | Require vertical intent threshold. |
| Swipe right from home | Productivity widgets | Horizontal page transition. |
| Swipe left from home | Android widgets | Horizontal page transition. |
| Back from drawer | Return to previous page/home | Respect Android predictive back where supported. |
| Long press home | Customization sheet | Avoid conflict with system home gesture. |
| Double tap home | Optional configured action | Do not promise screen lock until native implementation is verified. |
| Tap app | Launch app | Handle missing/disabled package. |

## Gesture conflict rules
1. Determine gesture intent from touch slop and direction, not the first few pixels.
2. Horizontal navigation must not trigger when a user is vertically scrolling a widget.
3. Vertical drawer gesture must not steal a horizontal page swipe.
4. Native Android widgets own their internal touch interactions; do not intercept their gestures unnecessarily.
5. Interactive controls must receive taps and long presses.
6. Edge-origin gestures should defer to Android system navigation where required.
7. Provide an accessibility alternative to every gesture-only navigation action.
8. If a gesture is cancelled, restore the previous page without leaving partial animation state.

## Edge cases
- Swipe begins over an interactive widget: widget interaction takes priority unless gesture clearly starts outside its bounds.
- Fast diagonal swipe: classify using dominant axis after a minimum movement threshold.
- App drawer opened while keyboard is visible: keyboard/back behaviour must be deterministic.
- Device rotation: preserve selected page and scroll position where feasible.
- Process death: restore last stable page, not an in-progress animation.
- Very small/large displays: maintain minimum touch target and readable clock.
- RTL language: mirror horizontal navigation semantics only after testing and documenting.
- One-handed use: keep search and key actions within reachable areas when possible.

## Motion language
- Page transitions: short, responsive and subtle.
- No long cinematic transitions.
- Use fade/scale only where it improves hierarchy.
- Respect Android animator duration scale and reduced-motion preferences.
