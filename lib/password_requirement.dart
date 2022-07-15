import 'package:flutter/material.dart';

class PasswordRequirement extends StatefulWidget {
  const PasswordRequirement({Key? key}) : super(key: key);

  @override
  State<PasswordRequirement> createState() => _PasswordRequirementState();
}

class _PasswordRequirementState extends State<PasswordRequirement> {
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool minimal8Char = false;
  bool hurufKecilBesar = false;
  bool minimal1Angka = false;

  void validateRequirement() {
    /// Password Min 8 Char
    if (password.text.length >= 8) {
      minimal8Char = true;
    } else {
      minimal8Char = false;
    }

    /// Huruf Kecil Besar
    if (password.text.contains(RegExp(r"(?=.*[a-z])(?=.*[A-Z])"))) {
      hurufKecilBesar = true;
    } else {
      hurufKecilBesar = false;
    }

    /// Minimal 1 Angka
    if (password.text.contains(RegExp(r"[0-9]"))) {
      minimal1Angka = true;
    } else {
      minimal1Angka = false;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Password Requirement",
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
                        validateRequirement();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Silahkan masukkan password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            minimal8Char
                                ? const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Panjang minimal 8 karakter",
                              style: TextStyle(
                                  color:
                                      minimal8Char ? Colors.green : Colors.red),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            hurufKecilBesar
                                ? const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Huruf kecil dan besar",
                              style: TextStyle(
                                  color: hurufKecilBesar
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            minimal1Angka
                                ? const Icon(
                                    Icons.check_circle_outline_rounded,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.red,
                                  ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Minimal 1 Angka",
                              style: TextStyle(
                                  color: minimal1Angka
                                      ? Colors.green
                                      : Colors.red),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
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
