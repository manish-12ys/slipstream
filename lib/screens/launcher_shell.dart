import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../models/installed_app.dart';
import '../navigation/gesture_classifier.dart';
import '../services/platform_bridge.dart';

class LauncherShell extends StatefulWidget {
  const LauncherShell({super.key});

  @override
  State<LauncherShell> createState() => _LauncherShellState();
}

class _LauncherShellState extends State<LauncherShell> {
  final _bridge = PlatformBridge();
  DateTime _now = DateTime.now();
  Timer? _clockTimer;
  Uint8List? _wallpaper;
  int _page = 0;
  bool _drawerOpen = false;

  @override
  void initState() {
    super.initState();
    _clockTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (mounted) setState(() => _now = DateTime.now());
    });
    unawaited(_loadWallpaper());
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadWallpaper() async {
    final wallpaper = await _bridge.getWallpaper();
    if (mounted && wallpaper != null) setState(() => _wallpaper = wallpaper);
  }

  void _handleSwipe(DragEndDetails details) {
    final velocity = details.velocity.pixelsPerSecond;
    final intent = classifySwipe(dx: velocity.dx, dy: velocity.dy);
    if (!mounted) return;
    setState(() {
      switch (intent) {
        case GestureIntent.productivity:
          _page = 1;
        case GestureIntent.androidWidgets:
          _page = -1;
        case GestureIntent.appDrawer:
          _drawerOpen = true;
        case GestureIntent.none:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanEnd: _handleSwipe,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_wallpaper != null)
              Image.memory(_wallpaper!, fit: BoxFit.cover)
            else
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff263238), Color(0xff0d1014)],
                  ),
                ),
              ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black26, Colors.black54],
                ),
              ),
            ),
            if (_page == 0) _HomeClock(now: _now),
            if (_page == 1)
              _InfoPage(
                title: 'Our widgets',
                subtitle: 'Nothing on the pit wall yet.',
                icon: Icons.dashboard_customize_outlined,
                action: _openSettings,
                actionLabel: 'Settings',
              ),
            if (_page == -1)
              const _InfoPage(
                title: 'Android widgets',
                subtitle:
                    'No widgets on the grid. Add one from the widget picker.',
                icon: Icons.widgets_outlined,
              ),
            if (_drawerOpen)
              _AppDrawer(
                bridge: _bridge,
                onClose: () => setState(() => _drawerOpen = false),
              ),
          ],
        ),
      ),
    );
  }

  void _openSettings() {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => const SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Appearance'),
              Text('System theme and wallpaper options will appear here.'),
              SizedBox(height: 12),
              Text('Home screen'),
              Text('Clock and gesture preferences will appear here.'),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeClock extends StatelessWidget {
  const _HomeClock({required this.now});

  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final time = MaterialLocalizations.of(context).formatTimeOfDay(
      TimeOfDay.fromDateTime(now),
      alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
    );
    return Center(
      child: Semantics(
        label: 'Current time $time',
        child: Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 64,
            fontWeight: FontWeight.w300,
            letterSpacing: -2,
          ),
        ),
      ),
    );
  }
}

class _InfoPage extends StatelessWidget {
  const _InfoPage({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.action,
    this.actionLabel,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? action;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 48),
                const SizedBox(height: 16),
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text(subtitle, textAlign: TextAlign.center),
                if (action != null) ...[
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: action,
                    icon: const Icon(Icons.settings_outlined),
                    label: Text(actionLabel!),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppDrawer extends StatefulWidget {
  const _AppDrawer({required this.bridge, required this.onClose});

  final PlatformBridge bridge;
  final VoidCallback onClose;

  @override
  State<_AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<_AppDrawer> {
  final _searchController = TextEditingController();
  late Future<List<InstalledApp>> _apps;
  StreamSubscription<void>? _packageSubscription;

  @override
  void initState() {
    super.initState();
    _apps = widget.bridge.getInstalledApps();
    _searchController.addListener(() => setState(() {}));
    _packageSubscription = widget.bridge.packageChanges.listen((_) {
      if (mounted) setState(() => _apps = widget.bridge.getInstalledApps());
    });
  }

  @override
  void dispose() {
    _packageSubscription?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: .98),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  key: const Key('drawer-close'),
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close),
                  tooltip: 'Close app drawer',
                ),
                Expanded(
                  child: Text(
                    'App drawer',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'Drawer options',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                key: const Key('app-search'),
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search apps',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<InstalledApp>>(
                future: _apps,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return _DrawerMessage(
                      message: 'Apps could not be loaded.',
                      action: () => setState(
                        () => _apps = widget.bridge.getInstalledApps(),
                      ),
                    );
                  }
                  final query = _searchController.text.trim().toLowerCase();
                  final apps = (snapshot.data ?? const <InstalledApp>[])
                      .where((app) => app.label.toLowerCase().contains(query))
                      .toList();
                  if (apps.isEmpty) {
                    return const _DrawerMessage(message: 'No matching apps.');
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: apps.length,
                    itemBuilder: (context, index) {
                      final app = apps[index];
                      return ListTile(
                        key: Key('app-${app.packageName}'),
                        leading: _AppIcon(app),
                        title: Text(app.label),
                        subtitle: Text(app.packageName),
                        enabled: app.isEnabled,
                        onTap: () async {
                          try {
                            await widget.bridge.launchApp(app.packageName);
                            if (mounted) widget.onClose();
                          } on PlatformBridgeException catch (error) {
                            if (!context.mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error.message)),
                            );
                          }
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerMessage extends StatelessWidget {
  const _DrawerMessage({required this.message, this.action});

  final String message;
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          if (action != null) ...[
            const SizedBox(height: 12),
            OutlinedButton(onPressed: action, child: const Text('Retry')),
          ],
        ],
      ),
    );
  }
}

class _AppIcon extends StatelessWidget {
  const _AppIcon(this.app);

  final InstalledApp app;

  @override
  Widget build(BuildContext context) {
    if (app.icon == null) return const CircleAvatar(child: Icon(Icons.apps));
    return CircleAvatar(
      backgroundImage: MemoryImage(base64Decode(app.icon!)),
      backgroundColor: Colors.transparent,
    );
  }
}
