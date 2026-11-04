# 23 — Flutter / Android API Contracts

These are proposed contracts; adapt them to the actual Pigeon schema.

## App discovery
Request: `includeIcons`, `refresh`.
Response: `apps`, `status` (`success`, `partial`, `permissionRequired`, `unsupported`, `failure`).
`InstalledAppDto`: `packageName`, `label`, nullable icon reference/data, `isEnabled`, `launchable`, optional version code.

## Launch app
Request: `packageName`.
Response: `launched`, nullable `errorCode` (`notFound`, `disabled`, `noLaunchIntent`, `security`, `unsupported`, `unknown`).

## Package event
`packageName`, `changeType` (`added`, `removed`, `changed`), `timestamp`.

## Home role
Expose status (`isDefaultHome`, `canRequestRole`, platform status) and a user-initiated request action. Never silently change the default launcher.

## Android widgets
Native operations: enumerate providers, allocate ID, bind, configure, remove, inspect host state. Actual RemoteViews rendering stays in Android native view hosting; do not serialize RemoteViews as Flutter JSON.

## Error model
Map platform failures to stable codes and safe messages. Never expose stack traces or raw exception strings to UI.

## Contract change process
Update this doc, Pigeon definition, Kotlin adapter, Dart adapter and contract tests; record breaking changes in `27_CHANGELOG.md`.
