package com.sara.bluetoothshare

import android.annotation.SuppressLint
import android.bluetooth.BluetoothManager
import android.util.Log
import com.sara.bluetoothshare.bluetoothservice.BlueToothConnector
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val methodChannelLine = "com.sara.blueToothShare/bluetooth"
    private val blueToothConnector: BlueToothConnector by lazy {
        val blueToothManager: BluetoothManager =
            getSystemService(BluetoothManager::class.java)
        val blueToothAdapter = blueToothManager.adapter
        requireNotNull(blueToothAdapter) {
            "Bluetooth is not support on this device"
        }
        BlueToothConnector(blueToothAdapter)
    }

    @SuppressLint("MissingPermission")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannelLine)
            .setMethodCallHandler { call, result ->

                when (call.method) {
                    "checkBluetoothTurnOn" -> {
                        val blueToothResult = blueToothConnector.isBlueToothOn()
                        result.success(blueToothResult)
                    }

                    "setBluetoothName" -> {
                        val name = call.argument<String>("name")
                        val blueToothResult = blueToothConnector.setBlueToothName(name as String)
                        result.success(blueToothResult)
                    }

                    "getBlueToothDevicesBound" -> {
                        val listOfDeviceModel = blueToothConnector.getBlueToothDevices()
                        val mapOfDevice = listOfDeviceModel?.map {
                            mapOf(
                                "name" to it.name,
                                "address" to it.address
                            )
                        }
                        result.success(mapOfDevice)
                    }

                    "startDiscovery" -> {
                        val blueConnectionStarted = blueToothConnector.startLookingDevices()
                        Log.d("FROM ANDROID THE STATUS OF START DISCOVERY","$blueConnectionStarted")
                        result.success(blueConnectionStarted)
                    }

                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }
}
