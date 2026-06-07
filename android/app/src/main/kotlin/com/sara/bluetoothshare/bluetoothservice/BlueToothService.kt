package com.sara.bluetoothshare.bluetoothservice

import android.bluetooth.BluetoothAdapter
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log

class BlueToothService  : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {

        Log.d("BT", "error: ${intent.toString()}")
        Log.d("API_LEVEL", Build.VERSION.SDK_INT.toString())

        val action = intent?.action ?: return

        if (action != BluetoothAdapter.ACTION_STATE_CHANGED) {
            return
        }

        val state = intent.getIntExtra(
            BluetoothAdapter.EXTRA_STATE,
            BluetoothAdapter.ERROR
        )

        when (state) {

            BluetoothAdapter.STATE_ON -> {
                Log.d("BT", "Bluetooth ON")
            }

            BluetoothAdapter.STATE_OFF -> {
                Log.d("BT", "Bluetooth OFF")
            }

            BluetoothAdapter.STATE_TURNING_ON -> {
                Log.d("BT", "Bluetooth Turning ON")
            }

            BluetoothAdapter.STATE_TURNING_OFF -> {
                Log.d("BT", "Bluetooth Turning OFF")
            }
        }
    }


}