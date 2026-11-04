class InstalledApp {
  const InstalledApp({
    required this.packageName,
    required this.label,
    required this.icon,
    required this.isEnabled,
  });

  factory InstalledApp.fromMap(Map<Object?, Object?> map) {
    return InstalledApp(
      packageName: map['packageName'] as String,
      label: map['label'] as String,
      icon: map['icon'] as String?,
      isEnabled: map['isEnabled'] as bool? ?? true,
    );
  }

  final String packageName;
  final String label;
  final String? icon;
  final bool isEnabled;
}
