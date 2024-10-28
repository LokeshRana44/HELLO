import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Setting());
}

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Settings',
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('General'),
            tiles: [
              SettingsTile(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
                // value: Text('Hindi'),
              ),
              SettingsTile(
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
                // initialValue: true,
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: [
              SettingsTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
              SettingsTile(
                leading: Icon(Icons.lock),
                title: Text('Password'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}