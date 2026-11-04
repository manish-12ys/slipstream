# 16 — Release Checklist

## Product
- [ ] Product name and package ID finalized.
- [ ] Feature scope for release frozen.
- [ ] Onboarding explains Home selection and gestures.
- [ ] Empty/loading/error states reviewed.
- [ ] Microcopy proofread and localization-ready.

## Android
- [ ] HOME intent filter verified.
- [ ] Default Home selection works on target Android versions.
- [ ] Package visibility declarations justified.
- [ ] App launch handles missing/disabled apps.
- [ ] Back and predictive back tested.
- [ ] Widget host tested if included.
- [ ] Permission grant/revoke tested.
- [ ] OEM-specific behaviour documented.

## UI and accessibility
- [ ] Dynamic color tested.
- [ ] Fallback palette tested.
- [ ] Light/dark themes tested.
- [ ] TalkBack tested.
- [ ] Large font and display size tested.
- [ ] Contrast and touch targets reviewed.
- [ ] Reduced motion respected.
- [ ] Gesture alternatives exist.

## Quality
- [ ] `dart format` clean.
- [ ] `flutter analyze` clean.
- [ ] Unit tests pass.
- [ ] Widget tests pass.
- [ ] Integration tests pass.
- [ ] Release build succeeds.
- [ ] No critical crashes or ANRs.
- [ ] Performance profiled on low/mid/high-tier devices.

## Privacy and policy
- [ ] Privacy policy reflects actual data handling.
- [ ] All permissions have feature-specific rationale.
- [ ] Accessibility/Device Admin/Usage Access policy reviewed if used.
- [ ] No undisclosed analytics or trackers.
- [ ] Store Data safety form matches actual behaviour.
- [ ] Third-party assets and fonts have suitable licences.

## Store assets
- [ ] Original icon and wordmark.
- [ ] Screenshots from real app.
- [ ] Accurate feature description.
- [ ] Support contact and privacy policy URL.
- [ ] Version and release notes.
