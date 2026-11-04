# 02 — Feature Specification

Priority: **P0** = required for first usable release, **P1** = next release, **P2** = later / optional.

## Home and navigation
| ID | Feature | Priority | Requirement |
|---|---|---:|---|
| HOME-01 | Wallpaper-first home | P0 | Render current system/user wallpaper or selected launcher wallpaper as background. |
| HOME-02 | Minimal clock | P0 | Show time; optional date and clock style. Default contains no other visible controls. |
| HOME-03 | Clock customization | P1 | Size, alignment, format, font and optional date. |
| NAV-01 | Swipe right | P0 | Navigate to launcher productivity widgets. |
| NAV-02 | Swipe left | P0 | Navigate to Android app-widget dashboard. |
| NAV-03 | Swipe up | P0 | Open app drawer. |
| NAV-04 | Settings access | P0 | Settings entry on productivity widgets page; also reachable from drawer menu. |
| NAV-05 | Double tap | P1 | Configurable action; default may be screen-off only if reliable supported API/device policy exists. |
| NAV-06 | Gesture customization | P2 | Allow user to remap supported gestures. |

## App drawer
| ID | Feature | Priority | Requirement |
|---|---|---:|---|
| APP-01 | Installed apps | P0 | Show launchable user apps using Android package APIs. |
| APP-02 | Launch app | P0 | Tap app to launch its launch intent. |
| APP-03 | Search | P0 | Filter app names locally as user types. |
| APP-04 | Sorting | P1 | Alphabetical; recent/usage-based only after explicit Usage Access grant. |
| APP-05 | App categories | P2 | Optional category filters. |
| APP-06 | Hide apps | P1 | Hide from launcher UI; do not imply app is uninstalled or secured. |
| APP-07 | App details / long press | P1 | Open Android app info or show supported shortcuts. |
| APP-08 | App shortcuts | P2 | Support Android launcher shortcuts where API and app allow. |

## Productivity widgets page
| ID | Feature | Priority | Requirement |
|---|---|---:|---|
| WID-01 | Quick notes | P1 | Local notes with create/edit/delete. |
| WID-02 | To-do list | P1 | Tasks, completion state and optional due date. |
| WID-03 | Habit tracker | P2 | Daily check-ins and simple history. |
| WID-04 | Event countdown | P2 | User-created events and countdowns. |
| WID-05 | Media controls | P2 | Use Android media session controls where permitted; handle no active session. |
| WID-06 | Launcher widget layout | P1 | Reorder, resize within supported layout model, hide/show. |

## Android app-widget page
| ID | Feature | Priority | Requirement |
|---|---|---:|---|
| AW-01 | Widget picker | P1 | Enumerate providers and let user select an app widget. |
| AW-02 | Widget host | P1 | Host native Android AppWidget RemoteViews in a native container. |
| AW-03 | Resize/reconfigure | P2 | Respect provider resize/configuration support. |
| AW-04 | Widget persistence | P1 | Persist widget IDs, provider component and layout position. |
| AW-05 | Widget lifecycle | P1 | Handle deletion, provider removal, app update and process recreation. |

## Spaces and organization
| ID | Feature | Priority | Requirement |
|---|---|---:|---|
| SPACE-01 | Multiple spaces | P1 | User can create and switch between named spaces. |
| SPACE-02 | Per-space wallpaper/theme | P2 | Optional wallpaper and accent overrides. |
| SPACE-03 | Per-space app groups | P2 | Store group membership and layout per space. |
| GROUP-01 | App groups | P2 | Named collections of installed apps. |
| GROUP-02 | Folder/grid presentation | P2 | Provide compact list/grid options. |
| RAD-01 | Favourite/radial menu | P2 | Optional quick-launch wheel; no blocking of core navigation. |

## Search and focus
| ID | Feature | Priority | Requirement |
|---|---|---:|---|
| SEARCH-01 | Global launcher search | P1 | Search installed apps first. |
| SEARCH-02 | Contacts/calendar | P2 | Only with explicit permissions and clear privacy rationale. |
| FOCUS-01 | Focus session | P2 | Local timer and user-selected distraction list. |
| FOCUS-02 | App launch pause | P2 | Optional confirmation/delay; never claim to block an app unless technically enforced. |

## Appearance
- Material You dynamic color on supported Android versions.
- Fallback palette on unsupported devices.
- Optional racing accent presets: Apex Orange, Midnight Blue, Trackside Green, Carbon.
- User-selected icon pack support only if implementation and licensing are appropriate.
- Reduced motion and high contrast options.
- Blur is optional and must have a non-blur fallback.

## Explicit v1 acceptance criteria
- A user can set the app as default launcher.
- Clock and wallpaper are visible on home.
- Swipe right/left/up work.
- App drawer lists installed launchable apps.
- Search filters results correctly.
- Tapping launches the correct package.
- Settings are reachable.
- App state survives process recreation.
- No mandatory network connection.
