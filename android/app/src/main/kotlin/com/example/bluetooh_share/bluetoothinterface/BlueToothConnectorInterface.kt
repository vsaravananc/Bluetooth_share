package com.example.bluetooh_share.bluetoothinterface
import com.example.bluetooh_share.model.BlueToothDeviceModel

interface BlueToothConnectorInterface  {
    fun isBlueToothOn(): Boolean
    fun setBlueToothName( name : String ) : Boolean
    fun getBlueToothDevices () : List<BlueToothDeviceModel>?
}