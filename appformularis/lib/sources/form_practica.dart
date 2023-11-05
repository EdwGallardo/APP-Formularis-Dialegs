import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class PracticaForm extends StatefulWidget {
  const PracticaForm({Key? key}) : super(key: key);

  @override
  State<PracticaForm> createState() {
    return _PruebaFormState();
  }
}

class _PruebaFormState extends State<PracticaForm> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;


  final _formKey = GlobalKey<FormBuilderState>();

  var speedVehicle = ['20km/h', '30km/h', '40km/h', '50km/h'];

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _formKey,
            // enabled: false,
            onChanged: () {
              _formKey.currentState!.save();
              debugPrint(_formKey.currentState!.value.toString());
            },
            autovalidateMode: AutovalidateMode.disabled,
            skipDisabled: true,

            child: Column(
              children: <Widget>[
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
                  children: [
                    //Text('Texto antes del primer FormBuilder'),
                    FormBuilderRadioGroup<String>(
                      decoration: const InputDecoration(
                        labelText: 'Please provide the speed of vehicle?',
                        border: OutlineInputBorder(),

                      ),
                      initialValue: null,
                      orientation: OptionsOrientation.vertical,
                      name: 'speed_vehicle',
                      onChanged: _onChanged,
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required()]),
                      options: ['above 40km/h', 'below 40km/h', '0 km/h']
                          .map((lang) => FormBuilderFieldOption(
                                value: lang,
                                child: Row(
                                  children: [
                                    Text(lang),
                                    Spacer(flex: 10),
                                  ],
                                ),
                              ))
                          .toList(growable: false),
                      controlAffinity: ControlAffinity.leading,
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
                  children: [
                    //Text('Enter remarks'),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'remarks',
                      decoration: const InputDecoration(
                        labelText: 'Enter remarks',
                        hintText: 'Enter remarks here',
                        // Agrega un placeholder
                        border: OutlineInputBorder(),
                        // Utiliza un borde de contorno
                        filled: true,
                        // Activa el relleno del fondo
                        fillColor: Colors.grey, // Color de fondo gris claro
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
                  children: [
                    //Text('Texto antes del primer FormBuilder'),

                FormBuilderDropdown<String>(
                  name: 'speed',
                  decoration: const InputDecoration(
                    labelText: 'Select Speed',
                    border: OutlineInputBorder(),
                  ),
                  validator: FormBuilderValidators.compose(
                      [FormBuilderValidators.required()]),
                  items: speedVehicle
                      .map((speed) => DropdownMenuItem(
                            alignment: AlignmentDirectional.center,
                            value: speed,
                            child: Text(speed),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                    });
                  },
                  valueTransformer: (val) => val?.toString(),
                ),
                ],
            ),
                const SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Alinea los elementos a la izquierda
                  children: [
                    //Text('Please provide the speed of vehicle past 1 hour'),
                FormBuilderCheckboxGroup<String>(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  orientation: OptionsOrientation.vertical,
                  decoration:
                      const InputDecoration(labelText: 'Please provide the speed of vehicle past 1 hour',
                        border: OutlineInputBorder(),),
                  name: 'speeds',

                  // initialValue: const ['Dart'],
                  options: const [
                    FormBuilderFieldOption(value: '     20km/h'),
                    FormBuilderFieldOption(value: '     30km/h'),
                    FormBuilderFieldOption(value: '     40 km/h'),
                    FormBuilderFieldOption(value: '     50 km/h'),
                  ],
                  onChanged: _onChanged,
                  separator: const VerticalDivider(
                    width: 10,
                    thickness: 5,
                    color: Colors.red,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.minLength(1),
                    FormBuilderValidators.maxLength(4),
                  ]),
                ),
                ],
            ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
