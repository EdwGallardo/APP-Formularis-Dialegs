import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
//import 'package:flutter_fast_forms_example/form_array_item.dart';

//import 'custom_form_field.dart';



class FastFormSample extends StatelessWidget {
  const FastFormSample({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Flutter Fast Forms Example';

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
        return CupertinoApp(
          title: title,
          home: FormPage(title: title),
        );

      case TargetPlatform.android:
      default:
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorSchemeSeed: Colors.deepPurple[700],
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.deepPurple[700],
          ),
          home: FormPage(title: title),
        );
    }
  }
}

class FormPage extends StatelessWidget {
  FormPage({super.key, required this.title});

  final formKey = GlobalKey<FormState>();
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (theme.platform) {
      case TargetPlatform.iOS:
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text(title)),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FastForm(
                    adaptive: true,
                    formKey: formKey,
                    children: _buildCupertinoForm(context),
                    onChanged: (value) {
                      // ignore: avoid_print
                      print('Form changed: ${value.toString()}');
                    },
                  ),
                  CupertinoButton(
                    child: const Text('Reset'),
                    onPressed: () => formKey.currentState?.reset(),
                  ),
                ],
              ),
            ),
          ),
        );

      case TargetPlatform.android:
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            elevation: 4.0,
            shadowColor: theme.shadowColor,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FastForm(
                    formKey: formKey,
                    inputDecorationTheme: InputDecorationTheme(
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.grey[700]!, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.red[500]!, width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    children: _buildForm(context),
                    onChanged: (value) {
                      // ignore: avoid_print
                      print('Form changed: ${value.toString()}');
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Reset'),
                    onPressed: () => formKey.currentState?.reset(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }

  List<Widget> _buildForm(BuildContext context) {
    return [
      FastFormSection(
        padding: const EdgeInsets.all(16.0),
        header: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Form Example Section',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        children: [
          FastAutocomplete<String>(
            name: 'autocomplete',
            labelText: 'Autocomplete',
            options: const ['Alaska', 'Alabama', 'Connecticut', 'Delaware'],
          ),
          FastDatePicker(
            name: 'date_picker',
            labelText: 'Date Picker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          FastDateRangePicker(
            name: 'date_range_picker',
            labelText: 'Date Range Picker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
          ),
          const FastTimePicker(
            name: 'time_picker',
            labelText: 'Time Picker',
          ),
          const FastChipsInput(
            name: 'input_chips',
            labelText: 'Input Chips',
            options: ['Angular', 'React', 'Vue', 'Svelte', 'Flutter'],
            initialValue: [
              'HTML',
              'CSS',
              'React',
              'Dart',
              'TypeScript',
              'Angular',
            ],
          ),

        ],
      ),
    ];
  }

  List<Widget> _buildCupertinoForm(BuildContext context) {
    return [
      FastFormSection(
        adaptive: true,
        insetGrouped: true,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        header: const Text('Form Example Section'),
        children: [
          const FastTextField(
            name: 'text_field',
            labelText: 'Text Field',
            placeholder: 'Placeholder',
            helperText: 'Helper Text',
          ),
          const FastSwitch(
            name: 'switch',
            labelText: 'Remind me on a day',
          ),
          const FastCheckbox(
            name: 'checkbox',
            labelText: 'I accept',
          ),
          FastDatePicker(
            name: 'datepicker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
            labelText: 'Datepicker',
            showModalPopup: true,
          ),
          FastSegmentedControl<String>(
            name: 'segmented_control',
            labelText: 'Class',
            children: const {
              'economy': Text('Economy'),
              'business': Text('Business'),
              'first': Text('First'),
            },
          ),
          FastSlider(
            name: 'slider',
            min: 0,
            max: 10,
            prefixBuilder: (field) {
              return CupertinoButton(
                padding: const EdgeInsets.only(left: 0),
                onPressed: field.widget.enabled
                    ? () => field.didChange(field.widget.min)
                    : null,
                child: const Icon(CupertinoIcons.volume_mute),
              );
            },
            suffixBuilder: (field) {
              return CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: field.widget.enabled
                    ? () => field.didChange(field.widget.max)
                    : null,
                child: const Icon(CupertinoIcons.volume_up),
              );
            },
            helperBuilder: (FormFieldState<double> field) {
              return const DefaultTextStyle(
                style: TextStyle(
                  color: CupertinoColors.black,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 6.0),
                  child: Text('This is a help text'),
                ),
              );
            },
            validator: (value) => value! > 8 ? 'Volume is too high' : null,
          ),
          FastDatePicker(
            name: 'timepicker',
            firstDate: DateTime(1970),
            lastDate: DateTime(2040),
            labelText: 'TimePicker',
            mode: CupertinoDatePickerMode.time,
          ),
        ],
      ),
    ];
  }
}