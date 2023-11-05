import 'sources/conditional_fields.dart';
import 'sources/dynamic_fields.dart';
import 'sources/related_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'sources/form_practica.dart';
import 'sources/stepper_sample.dart';
import 'sources/fast_forms.dart';
import 'package:example/sources/fast_form2.dart';
import 'package:example/sources/fast_form_complete.dart';



import 'code_page.dart';
import 'sources/complete_form.dart';
import 'sources/custom_fields.dart';
import 'sources/signup_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter FormBuilder Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FormBuilderLocalizations.delegate,
        ...GlobalMaterialLocalizations.delegates,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.supportedLocales,
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CodePage(
      title: 'Flutter Form Builder',
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Complete Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Complete Form',

                      child: CompleteForm(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Custom Fields'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Custom Fields',
                      child: CustomFields(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Signup Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Signup Form',
                      child: SignupForm(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Dynamic Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Dynamic Form',
                      child: DynamicFields(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Conditional Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Conditional Form',
                      child: ConditionalFields(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Related Fields'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Related Fields',
                      child: RelatedFields(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Practica Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Practica Form',
                      child: PracticaForm(),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Stepper Sample'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Edwin Gallardo',
                      child: StepperSample(),   //debo de ccrear y modificar la classe que llamo para que sea --> Stepper Sample
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Fast Form'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Edwin Gallardo',
                      child: FastFormSample(),   //debo de ccrear y modificar la classe que llamo para que sea --> Stepper Sample
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Fast Form 2'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Edwin Gallardo',
                      child: FastFormSample2(),   //debo de ccrear y modificar la classe que llamo para que sea --> Stepper Sample
                    );
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Fast Form Complete'),
            trailing: const Icon(Icons.arrow_right_sharp),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CodePage(
                      title: 'Edwin Gallardo',
                      child: FastFormComplete(),   //debo de ccrear y modificar la classe que llamo para que sea --> Stepper Sample
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
