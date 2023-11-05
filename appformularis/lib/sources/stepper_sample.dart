import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';


class StepperSample extends StatefulWidget {
  const StepperSample({Key? key}) : super(key: key);

  @override
  State<StepperSample> createState() {
    return _StepperSampleState();
  }
}

class _StepperSampleState extends State<StepperSample> {

  //lista de paginas o pasos
  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=0,
      title: Text('Personal'),
      content: Column(
        children: <Widget> [
          TextFormField(
            controller: name,
            decoration: InputDecoration(labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15), // Agrega un espacio de 10 unidades entre los campos
          TextFormField(
            controller: surname,
            decoration: InputDecoration(labelText: 'Surname',
                border: OutlineInputBorder()),
            // Set the maximum number of lines
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: alies,
            decoration: InputDecoration(labelText: 'Alies',
                border: OutlineInputBorder()),
          )
        ],
      ),
    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >=1,
      title: Text('Contact'),
      content: Column(
        children: <Widget> [
          TextFormField(
            controller: email,
            decoration: InputDecoration(labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15), // Agrega un espacio de 10 unidades entre los campos
          TextFormField(
            controller: address,
            decoration: InputDecoration(labelText: 'Address',
                border: OutlineInputBorder()),
            minLines: 6,  // Set the minimum number of lines
            maxLines: 10,  // Set the maximum number of lines
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: movil,
            decoration: InputDecoration(labelText: 'Mobile no',
                border: OutlineInputBorder()),
          )

        ],
      ),
    ),
    Step(
      isActive: currentStep >=2,
      title: Text('Upload'),
      content: Column(
        children: <Widget> [],
      ),
    )
  ];


  final _formKey = GlobalKey<FormBuilderState>();


  void _onChanged(dynamic val) => debugPrint(val.toString());

/*  void showCompletionMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Completado'),
          backgroundColor: Colors.green, // Color de fondo personalizado
        )
    );
  }*/
  void showCompletionMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Completado'),
          content: Text('La acción se ha completado con éxito.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el AlertDialog
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  //contador de pagina
  int currentStep = 0;
  bool isCompleted = false;

  final email = TextEditingController();
  final address = TextEditingController();
  final movil = TextEditingController();
  final name = TextEditingController();
  final surname = TextEditingController();
  final alies = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey, // Asigna la clave del Scaffold
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              steps: getSteps(),
              currentStep: currentStep,
              onStepContinue: () {
                final isLastStep = currentStep == getSteps().length - 1;
                if (isLastStep) {
                  setState(() => isCompleted = true);
                  showCompletionMessage(); // Muestra el mensaje de completado
                  // Aquí puedes enviar datos al servidor si es necesario
                } else {
                  setState(() => currentStep += 1);
                }
              },
              onStepTapped: (step) => setState(() => currentStep = step),
              onStepCancel:
              currentStep == 0 ? null : () => setState(() => currentStep -= 1),
            ),
          ),
          if (isCompleted)
            ElevatedButton(
              onPressed: () {
                showCompletionMessage();
              },
              child: Text('Actualizar'),
            ),
        ],
      ),
    );



  }
}
