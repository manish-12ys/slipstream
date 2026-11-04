# 15 — Architecture Decision Log

Record significant decisions here. Newest decisions go first.

## ADR-001 — Flutter UI with native Kotlin launcher integration
**Status:** Proposed  
**Decision:** Use Flutter for product UI and Kotlin for Android launcher APIs.  
**Reason:** Flutter provides fast UI iteration; Android launcher, package and widget APIs are native platform responsibilities.  
**Consequence:** Maintain a typed platform bridge and test Flutter/native integration.

## ADR-002 — Feature-first modular structure
**Status:** Proposed  
**Decision:** Organize code by feature, with presentation/domain/data boundaries where useful.  
**Reason:** Keeps app drawer, home, widgets, spaces and settings independently maintainable.  
**Consequence:** Avoid giant shared folders and avoid unnecessary abstraction in small features.

## ADR-003 — Local-first v1
**Status:** Proposed  
**Decision:** Core launcher and productivity data work offline and locally.  
**Reason:** A launcher must remain useful without network access and should minimize privacy risk.  
**Consequence:** No account or cloud sync in v1.

## ADR-004 — Android widgets are native
**Status:** Proposed  
**Decision:** Host real Android widgets through AppWidgetHost/RemoteViews; do not substitute Flutter cards.  
**Reason:** App widgets are supplied by other Android applications and use Android widget APIs.  
**Consequence:** Build a technical proof of concept before committing to full widget dashboard scope.

## ADR-005 — Home screen is intentionally minimal
**Status:** Accepted product requirement  
**Decision:** Default home shows only clock and wallpaper.  
**Reason:** This is the core product identity and reduces visual noise.  
**Consequence:** App access and productivity controls live behind gestures.

## Template for new ADRs
### ADR-XXX — Title
- Status: Proposed / Accepted / Superseded
- Context:
- Decision:
- Alternatives:
- Consequences:
- Date:
