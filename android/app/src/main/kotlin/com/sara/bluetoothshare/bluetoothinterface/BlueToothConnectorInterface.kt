package com.sara.bluetoothshare.bluetoothinterface
import com.sara.bluetoothshare.model.BlueToothDeviceModel

interface BlueToothConnectorInterface  {
    fun isBlueToothOn(): Boolean
    fun setBlueToothName( name : String ) : Boolean
    fun getBlueToothDevices () : List<BlueToothDeviceModel>?

    fun startLookingDevices() : Boolean
}