package com.example.bluetooh_share

import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity(){

    private val methodChannelLine = "com.example.bluetooh_share/bluetooth"
    private lateinit var blueToothAdapter: BluetoothAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val blueToothManager : BluetoothManager =
            getSystemService(BluetoothManager::class.java)

        blueToothAdapter  = blueToothManager.adapter

    }

    @SuppressLint("MissingPermission")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,methodChannelLine)
            .setMethodCallHandler {
                call, result ->

                when (call.method) {
                    "checkBluetoothTurnOn" -> {
                        val blueToothResult = checkBluetoothTurnOn()
                        result.success(blueToothResult)
                    }
                    "setBluetoothName" -> {
                        val name = call.argument<String>("name")
                        Log.d("BlueToothName from Flutter", name.toString())
                        Log.d("BlueToothName on Devices", blueToothAdapter.name)
                        val blueToothResult = setBluetoothName(name as String)
                        Log.d("BlueToothName on Devices", blueToothAdapter.name)
                        result.success(blueToothResult)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
        }
    }


    fun checkBluetoothTurnOn() : Boolean{
        return blueToothAdapter.isEnabled
    }

    @SuppressLint("MissingPermission")
    fun setBluetoothName(name : String) : Boolean {
          Log.d("BlueToothName", "Name: ${blueToothAdapter.name}")
        if(blueToothAdapter.state == BluetoothAdapter.STATE_OFF){
            Log.d("Bluetooth State", "Bluetooth is OFF")
            return false
        }else {
            Log.d("Bluetooth State", "Bluetooth is ON")
            return  blueToothAdapter.setName(name)
        }
    }
}
