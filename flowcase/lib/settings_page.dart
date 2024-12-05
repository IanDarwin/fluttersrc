import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'dialog_demos.dart';

/// Activity for Settings.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsState createState() => SettingsState();

}

class SettingsState extends State<SettingsPage> {

  SettingsState();

  @override
  void initState() {
    // Set any field states needed here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SettingsScreen(title: "Settings",
        children: <Widget>[
          SettingsGroup(title: "Personal Info",
              children: [
                TextInputSettingsTile(
                  title: "Name",
                  settingKey: Constants.keyForName,
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name!.isNotEmpty) {
                      return null;
                    }
                    return "Your name is required";
                  },
                  errorColor: Colors.redAccent,
                ),
                TextInputSettingsTile(
                  title: "Email",
                  settingKey: Constants.keyForEmail,
                  keyboardType: TextInputType.emailAddress,
                  validator: (str) {
                    if (str!.isNotEmpty) {
                      return null;
                    }
                    return "Deliverable email is required";
                  },
                  errorColor: Colors.redAccent,
                ),
                TextInputSettingsTile(
                  title: "Phone Number",
                  settingKey: Constants.keyForPhone,
                  keyboardType: TextInputType.phone,
                  validator: (phNum) {
                    if (phNum!.isNotEmpty) {
                      return null;
                    }
                    // Maybe check for + () - 0-9 - regex
                    return "Callable phone number is required";
                  },
                  errorColor: Colors.redAccent,
                ),
                TextInputSettingsTile(
                  title: "PIN code",
                  settingKey: Constants.keyForPINCode,
                  keyboardType: const TextInputType.numberWithOptions(signed:false, decimal:false),
                  validator: (pinCode) {
                    // The code is a 4-digit instr number + the 5-digit constant value
                    if (pinCode!.isNotEmpty  &&
                        RegExp(r'^\d+$').hasMatch(pinCode) &&
                        pinCode.length >= 5) {
                      return null;
                    }
                    return "PIN code must be 5+ numeric digits.";
                  },
                  errorColor: Colors.redAccent,
                ),
              ]),
          SettingsGroup(
            title: "Trip Information",
            children: [
              DropDownSettingsTile<int>(
                title: 'Default Trip Length',
                settingKey: Constants.keyForTripLength,
                  selected: 3,
                  values: const {
                  1: "1",
                  2: "2",
                  3: "3",
                  4: "4",
                  5: "5",
                }
              ),
              SwitchSettingsTile(
                leading: const Icon(Icons.calendar_today_rounded),
                settingKey: Constants.keyForSaveToCalendar,
                title: 'Add new trips to device calendar',
                onChange: (value) {
                  debugPrint('$Constants.KEY_SAVE_TO_CAL: $value');
                },
              ),
            ],
          ),
          SettingsGroup(
            title: "Personalization",
            children: [
              SwitchSettingsTile(
                title: "Dark mode",
                  leading: const Icon(Icons.dark_mode),
                  settingKey: Constants.keyForDarkMode,
                  onChange: (val) {
                    alert(context, "Change will take effect on app restart",
                        title:'Dark Mode ${val?'on':'off'}');
                  })
              ],
          )
        ]
    );
  }

  @override
  void dispose() {
	// Do we need anything here?
	super.dispose();
  }
}

// The values used here don't matter, but must be unique,
// and having them all in one place is good for maintenance.
class Constants {
	static const keyForName = "key_name";
  static const keyForEmail = "key_email_addr";
	static const keyForPhone = "key_phone_num";
	static const keyForPINCode = "key_pin_code";
	static const keyForTripLength = "key_trip_length";
	static const keyForSaveToCalendar = "key_save_to_calendar";
	static const keyForDarkMode = "key_use_dark_mode";
}
