import 'dart:math' as math;

enum GestureIntent { none, productivity, androidWidgets, appDrawer }

GestureIntent classifySwipe({
  required double dx,
  required double dy,
  double minimumDistance = 48,
}) {
  final distance = math.sqrt(dx * dx + dy * dy);
  if (distance < minimumDistance) return GestureIntent.none;
  if (dy.abs() > dx.abs()) {
    return dy < 0 ? GestureIntent.appDrawer : GestureIntent.none;
  }
  if (dx.abs() > dy.abs()) {
    return dx > 0 ? GestureIntent.productivity : GestureIntent.androidWidgets;
  }
  return GestureIntent.none;
}
