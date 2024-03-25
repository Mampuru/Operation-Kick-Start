import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends StatefulWidget {
  final Color? color;
  AppVersion({Key? key, this.color}) : super(key: key);

  @override
  _AppVersionState createState() => _AppVersionState();
}

class _AppVersionState extends State<AppVersion> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "v" + _packageInfo.version + "." + _packageInfo.buildNumber,
          style: TextStyle(color: widget.color),
        )
      ],
    );
  }
}
