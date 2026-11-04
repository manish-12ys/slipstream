# 25 — Visual Mockups and UI Reference

The accompanying `assets/mockups/slipstream_project_overview.png` is a generated concept board. It is inspiration, not a pixel-perfect specification. Where artwork conflicts with requirements, the written requirements win.

## Screens to design
1. **Minimal Home:** natural full-bleed wallpaper, large time, optional date; no dock/icons/search by default.
2. **Radial Quick Apps:** optional circular favourite-app menu, opened deliberately.
3. **App Drawer:** search first, clean app grid/list and alphabetical navigation.
4. **Pit Wall / Productivity:** notes, tasks, habit and media cards; restrained telemetry hierarchy.
5. **Focus Mode:** clear focus session start/stop state.
6. **Spaces:** Default, Work, Study and user-created environments.
7. **Android Widgets:** native Android app widgets, not simulated Flutter cards.
8. **Settings:** conventional Material 3 preferences.

## Visual hierarchy
Home clock is primary. Drawer search is primary. Productivity page should show a few useful cards, not a wall of metrics. Settings should remain familiar and accessible. Racing references are subtle and optional.

## Responsive/motion rules
Phone portrait first; support landscape without clipping. Use safe areas and system insets. Avoid fixed coordinates. Page transitions are quick and purposeful. Respect reduced-motion settings. No constant racing animations, flashing or decorative tachometers.
