import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:smart_cane/pages/settings/profile/profile_widgets.dart';

import 'more_widgets.dart';

class BlueTooth extends StatefulWidget {
  const BlueTooth({super.key});

  @override
  State<BlueTooth> createState() => _BlueToothState();
}

class _BlueToothState extends State<BlueTooth> {
  static String dropdownvalue = 'smart-cane-2';

  // List of items in our dropdown menu
  var items = [
    'smart-cane-1',
    'smart-cane-2',
    'smart-cane-3',
  ];

  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];

  // Initializing the Bluetooth connection state to be unknown
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  // Get the instance of the Bluetooth
  final FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

  // Track the Bluetooth connection with the remote device
  BluetoothConnection? connection;

  int deviceState = 0; // neutral

  bool _connected = false;
  String incomingData = '';
  // To track whether the device is still connected to Bluetooth
  bool isConnected() {
    if (connection != null && connection!.isConnected) return true;
    return false;
  }

  BluetoothDevice? device;
  List<BluetoothDevice> _devicesList = [];

  Future<void> getPairedDevices() async {
    List<BluetoothDevice> devices = [];

    // To get the list of paired devices
    try {
      devices = await _bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }

    // It is an error to call [setState] unless [mounted] is true.
    if (!mounted) {
      return;
    }

    // Store the [devices] list in the [_devicesList] for accessing
    // the list outside this class
    setState(() {
      _devicesList = devices;
    });
  }

  Future<bool> enableBluetooth() async {
    // Retrieving the current Bluetooth state
    _bluetoothState = await FlutterBluetoothSerial.instance.state;

    // If the Bluetooth is off, then turn it on first
    // and then retrieve the devices that are paired.
    if (_bluetoothState == BluetoothState.STATE_OFF) {
      await FlutterBluetoothSerial.instance.requestEnable();
      await getPairedDevices();
      return true;
    } else {
      await getPairedDevices();
    }
    return false;
  }

  void _connect() async {
    if (device == null) {
      print('No device selected');
    } else {
      setState(() {
        _connected = true;
      });
      connection = await BluetoothConnection.toAddress(device!.address);
      connection?.input?.listen((Uint8List data) {
        setState(() {
          incomingData = ascii.decode(data);
        });
        print('Data incoming: ${ascii.decode(data)}');
        connection!.output.add(data); // Sending data

        if (ascii.decode(data).contains('!')) {
          connection!.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });

      // If a device is selected from the
      // dropdown, then use it here
    }
  }

  void _disconnect() async {
    // Closing the Bluetooth connection
    await connection!.close();
    print('Device disconnected');

    // Update the [_connected] variable
    if (!connection!.isConnected) {
      setState(() {
        _connected = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    // If the Bluetooth of the device is not enabled,
    // then request permission to turn on Bluetooth
    // as the app starts up
    enableBluetooth();

    // Listen for further state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // For retrieving the paired devices list
        getPairedDevices();
      });
    });
  }

  bool isDisconnecting = false;
  @override
  void dispose() {
    if (isConnected()) {
      setState(() => isDisconnecting = true);
      connection!.dispose();
      connection = null;
    }

    super.dispose();
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(const DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      for (var device in _devicesList) {
        items.add(DropdownMenuItem(
          value: device,
          child: Text(device.name!),
        ));
      }
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Bluetooth"),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.3,
                    image: AssetImage("assets/background-circuit.png"),
                    fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 40.0, top: 20),
                child: Container(
                  alignment: Alignment.topRight,
                  child: DropdownButton(
                    items: _getDeviceItems(),
                    onChanged: (value) => setState(() => device = value),
                    value: _devicesList.isNotEmpty ? device : null,
                  ),
                ),
              ),
              Img("assets/bluetooth.png"),
              Status(_connected),
              Disconnect(_connected),
            ]),
          ),
        ],
      ),
    );
  }
}
