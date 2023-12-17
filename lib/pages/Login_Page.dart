import 'package:flutter/material.dart';

void main() => runApp(const LoginPageApp());

class LoginPageApp extends StatelessWidget {
  const LoginPageApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 12),
                child: Image.asset(
                  'images/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              LoginForm(
                inputConfigs: [
                  const FormInputConfig(
                    attribute: 'Nome',
                    label: 'Name',
                    hint: 'Digite seu nome',
                    keyboardType: TextInputType.text,
                    obscureText: false,
                  ),
                  FormInputConfig(
                    attribute: 'email',
                    label: 'Email',
                    hint: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    validators: [
                          (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ],
                  ),
                  FormInputConfig(
                    attribute: 'password',
                    label: 'Password',
                    hint: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validators: [
                          (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ],
                  ),
                ],
                onSubmit: (Map<String, dynamic> result) {
                  print('Login submitted: $result');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FormInputConfig {
  final String attribute;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final List<String? Function(String?)>? validators;

  const FormInputConfig({
    required this.attribute,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.obscureText,
    this.validators,
  });
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.inputConfigs,
    this.onSubmit,
  }) : super(key: key);

  final List<FormInputConfig> inputConfigs;
  final void Function(Map<String, dynamic>)? onSubmit;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (var inputConfig in widget.inputConfigs) {
      _controllers[inputConfig.attribute] = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (var inputConfig in widget.inputConfigs)
            Container(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: _controllers[inputConfig.attribute],
                  decoration: InputDecoration(
                    labelText: inputConfig.label,
                    hintText: inputConfig.hint,
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: inputConfig.keyboardType,
                  obscureText: inputConfig.obscureText,
                  validator: (value) {
                    if (inputConfig.validators != null) {
                      for (var validator in inputConfig.validators!) {
                        var error = validator(value);
                        if (error != null) {
                          return error;
                        }
                      }
                    }
                    return null;
                  },
                ),
              ),
            ),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (widget.onSubmit != null) {
                      var result = <String, dynamic>{};
                      for (var entry in _controllers.entries) {
                        result[entry.key] = entry.value.text;
                      }
                      widget.onSubmit!(result);
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
          )
        ],
      ),
    );
  }
}
