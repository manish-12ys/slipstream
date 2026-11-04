package com.example.slipstream

import android.app.WallpaperManager
import android.content.Intent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import android.util.Base64
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel

private const val CHANNEL = "com.example.slipstream/platform"
private const val PACKAGE_EVENTS = "com.example.slipstream/package_events"

class MainActivity : FlutterActivity() {
    private var packageEventSink: EventChannel.EventSink? = null
    private val packageReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            packageEventSink?.success(intent?.data?.schemeSpecificPart)
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "getInstalledApps" -> result.success(getInstalledApps())
                    "launchApp" -> launchApp(call.argument<String>("packageName"), result)
                    "getWallpaper" -> result.success(getDeviceWallpaper())
                    else -> result.notImplemented()
                }
            }
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, PACKAGE_EVENTS)
            .setStreamHandler(object : EventChannel.StreamHandler {
                override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                    packageEventSink = events
                    registerReceiver(
                        packageReceiver,
                        IntentFilter().apply {
                            addAction(Intent.ACTION_PACKAGE_ADDED)
                            addAction(Intent.ACTION_PACKAGE_REMOVED)
                            addAction(Intent.ACTION_PACKAGE_CHANGED)
                            addDataScheme("package")
                        },
                        Context.RECEIVER_EXPORTED,
                    )
                }

                override fun onCancel(arguments: Any?) {
                    unregisterReceiver(packageReceiver)
                    packageEventSink = null
                }
            })
    }

    override fun onDestroy() {
        if (packageEventSink != null) {
            unregisterReceiver(packageReceiver)
            packageEventSink = null
        }
        super.onDestroy()
    }

    private fun getInstalledApps(): List<Map<String, Any?>> {
        val intent = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
        return packageManager.queryIntentActivities(intent, 0)
            .mapNotNull { info ->
                val packageName = info.activityInfo.packageName
                val label = info.loadLabel(packageManager)?.toString()?.trim()
                if (label.isNullOrEmpty()) return@mapNotNull null
                mapOf(
                    "packageName" to packageName,
                    "label" to label,
                    "icon" to drawableAsBase64(info.loadIcon(packageManager)),
                    "isEnabled" to info.activityInfo.enabled,
                )
            }
            .distinctBy { it["packageName"] }
    }

    private fun launchApp(packageName: String?, result: MethodChannel.Result) {
        if (packageName.isNullOrBlank()) {
            result.error("notFound", null, null)
            return
        }
        try {
            val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
            if (launchIntent == null) {
                result.error("noLaunchIntent", null, null)
                return
            }
            startActivity(launchIntent)
            result.success(null)
        } catch (_: SecurityException) {
            result.error("security", null, null)
        } catch (_: RuntimeException) {
            result.error("notFound", null, null)
        }
    }

    private fun getDeviceWallpaper(): ByteArray? {
        return try {
            WallpaperManager.getInstance(this).drawable?.let(::drawableAsBytes)
        } catch (_: RuntimeException) {
            null
        }
    }

    private fun drawableAsBase64(drawable: Drawable): String? {
        return Base64.encodeToString(drawableAsBytes(drawable), Base64.NO_WRAP)
    }

    private fun drawableAsBytes(drawable: Drawable): ByteArray {
        val width = drawable.intrinsicWidth.coerceIn(1, 1080)
        val height = drawable.intrinsicHeight.coerceIn(1, 1920)
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        Canvas(bitmap).also { drawable.setBounds(0, 0, it.width, it.height) }
            .also(drawable::draw)
        return java.io.ByteArrayOutputStream().use { output ->
            bitmap.compress(Bitmap.CompressFormat.JPEG, 85, output)
            bitmap.recycle()
            output.toByteArray()
        }
    }
}
