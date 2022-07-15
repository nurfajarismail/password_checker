import 'package:flutter/material.dart';

class PasswordChecker extends StatefulWidget {
  const PasswordChecker({Key? key}) : super(key: key);

  @override
  State<PasswordChecker> createState() => _PasswordCheckerState();
}

class _PasswordCheckerState extends State<PasswordChecker> {
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  // 0: No password
  // 1/4: Weak
  // 2/4: Medium
  // 3/4: Strong
  //   1:   Great
  //A function that validate user entered password
  bool validatePassword(String pass) {
    /// Password Strength
    if (password.text.isEmpty) {
      setState(() {
        password_strength = 0;
      });
    } else if (password.text.length < 6) {
      setState(() {
        password_strength = 1 / 4;
      });
    } else if (password.text.length < 8) {
      setState(() {
        password_strength = 2 / 4;
      });
    } else {
      if (pass_valid.hasMatch(password.text)) {
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Password Checker",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Password",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        keyForm.currentState!.validate();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Silahkan masukkan password";
                        } else {
                          //call function to check password
                          bool result = validatePassword(value);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: LinearProgressIndicator(
                        value: password_strength,
                        backgroundColor: Colors.grey[300],
                        minHeight: 10,
                        color: password_strength <= 1 / 4
                            ? Colors.red
                            : password_strength == 2 / 4
                                ? Colors.yellow
                                : password_strength == 3 / 4
                                    ? Colors.blue
                                    : password_strength == 4 / 4
                                        ? Colors.green
                                        : null,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue)),
                      onPressed: () {
                        if (keyForm.currentState!.validate()) ;
                      },
                      child: const SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Simpan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
