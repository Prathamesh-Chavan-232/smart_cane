// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConnectBLE extends StatefulWidget {
  const ConnectBLE({super.key});

  @override
  State<ConnectBLE> createState() => _ConnectBLEState();
}

class _ConnectBLEState extends State<ConnectBLE> {
  BluetoothDevice? _connectedDevice;
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  List<BluetoothService> _services = <BluetoothService>[];

  _addDeviceTolist(final BluetoothDevice device) {
    if (!devicesList.contains(device)) {
      setState(() {
        devicesList.add(device);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    flutterBlue.startScan();

    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Connect to Arduino"),
        ),
        body: _buildView(),
      );

  ListView _buildListViewOfDevices() {
    List<Container> containers = <Container>[];
    for (BluetoothDevice device in devicesList) {
      // ignore: sized_box_for_whitespace
      containers.add(Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(device.name == '' ? '(unknown device)' : device.name),
                  Text(device.id.toString()),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Connect',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                flutterBlue.stopScan();
                List<BluetoothService> services = <BluetoothService>[];
                try {
                  await device.connect();
                } catch (e) {
                  print(e);
                } finally {
                  services = await device.discoverServices();
                  setState(() {
                    _connectedDevice = device;
                    _services = services;
                  });
                }
              },
            ),
          ],
        ),
      ));
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }

  ListView _buildView() {
    if (_connectedDevice != null) {
      return _buildConnectedDeviceView();
    }
    return _buildListViewOfDevices();
  }

  ListView _buildConnectedDeviceView() {
    List<Container> containers = <Container>[];
    for (BluetoothService service in _services) {
      containers.add(
        Container(
          child: SizedBox(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(service.uuid.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }
}
