import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  double _sliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('ElevatedButton pressed!')),
                );
              },
              child: const Text('Elevated Button'),
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            const Divider(height: 32),
            SwitchListTile(
              title: const Text('Enable notifications'),
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Accept terms'),
              value: _checkboxValue,
              onChanged: (bool? value) {
                setState(() {
                  _checkboxValue = value ?? false;
                });
              },
            ),
            const Divider(height: 32),
            Row(
              children: [
                const Text('Volume'),
                Expanded(
                  child: Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _sliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                    },
                  ),
                ),
                Text(_sliderValue.round().toString()),
              ],
            ),
            const Divider(height: 32),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: const Text('English'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}