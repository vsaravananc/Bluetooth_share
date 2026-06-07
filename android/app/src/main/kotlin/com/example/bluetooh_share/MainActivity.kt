package com.example.bluetooh_share

import android.Manifest
import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.os.Bundle
import android.util.Log
import androidx.annotation.RequiresPermission
import com.example.bluetooh_share.bluetoothservice.BlueToothConnector
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(){

    private val methodChannelLine = "com.example.bluetooh_share/bluetooth"
    private  lateinit var blueToothConnector: BlueToothConnector

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val blueToothManager : BluetoothManager =
            getSystemService(BluetoothManager::class.java)

        val blueToothAdapter  = blueToothManager.adapter

        blueToothConnector = BlueToothConnector(blueToothAdapter = blueToothAdapter);

    }

    @SuppressLint("MissingPermission")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,methodChannelLine)
            .setMethodCallHandler {
                call, result ->

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
                    "getBlueToothDevicesBound"->{
                        blueToothConnector.getBlueToothDevices()
                        result.success(true)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
        }
    }
}
