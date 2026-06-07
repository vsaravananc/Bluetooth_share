package com.example.bluetooh_share.bluetoothservice

import android.Manifest
import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.util.Log
import androidx.annotation.RequiresPermission
import com.example.bluetooh_share.bluetoothinterface.BlueToothConnectorInterface
import com.example.bluetooh_share.model.BlueToothDeviceModel

class BlueToothConnector(val blueToothAdapter: BluetoothAdapter?) : BlueToothConnectorInterface {

    init {
        require(blueToothAdapter == null) { "BlueToothAdapter required to function" }
    }


    override fun isBlueToothOn(): Boolean {
        return blueToothAdapter?.isEnabled == true
    }

    @SuppressLint("MissingPermission")
    override fun setBlueToothName(name: String): Boolean {
        try {
            Log.d("BlueToothName", "Name: ${blueToothAdapter?.name}")
            if (blueToothAdapter?.state == BluetoothAdapter.STATE_OFF) {
                Log.d("Bluetooth State", "Bluetooth is OFF")
                return false
            } else {
                Log.d("Bluetooth State", "Bluetooth is ON")
                return blueToothAdapter?.setName(name) == true
            }
        } catch (e: Exception) {
            Log.d("During Set Name Issue", "$e")
            return false;
        }
    }

    @RequiresPermission(Manifest.permission.BLUETOOTH_CONNECT)
    override fun getBlueToothDevices(): List<BlueToothDeviceModel>? {
        try {
            val listOfBlueToothDevices = mutableListOf<BlueToothDeviceModel>()
            val blueToothDevices = blueToothAdapter?.bondedDevices
            if (blueToothDevices?.isNotEmpty() == true) {
                blueToothDevices.forEach { d ->
                    val blueToothDevice = BlueToothDeviceModel(
                        name = d.name,
                        address = d.address
                    )
                    listOfBlueToothDevices.add(blueToothDevice)
                    Log.d("Name :", "${d.name}")
                    Log.d("class :", "${d.bluetoothClass}")
                    Log.d("Mac :", "${d.address}")
                    Log.d("DONE : ", "~~~~~~~~~~~~~~~~")
                }
            }
            Log.d("BlueTooth Devices", "[$blueToothDevices]")
            return listOfBlueToothDevices;
        } catch (e: Exception) {
            Log.d("During Set Name Issue", "$e")
            return null;
        }
    }

}