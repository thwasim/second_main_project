import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../login_page/views/field.dart';
import '../controller/signpageprovider.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Signupprovider>(
      builder: (context, values, child) {
        return Column(
          children: [
            Signupfield(
              controller: context.watch<Signupprovider>().firstnamecontroller,
              hint: 'Full Name',
              icon: const Icon(Icons.person),
              validator: (value) => values.username(value),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Signupfield(
              controller: context.watch<Signupprovider>().emailcontroller,
              hint: 'Email',
              icon: const Icon(Icons.email),
              validator: (value) => values.email(value),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Signupfield(
              controller: context.watch<Signupprovider>().rolecontroller,
              hint: 'role',
              icon: const Icon(Icons.person_pin),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Signupfield(
              controller: context.watch<Signupprovider>().passwordcontroller,
              hint: 'Password',
              icon: const Icon(Icons.vpn_key),
              validator: (value) => values.password(value),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Signupfield(
                controller:
                    context.watch<Signupprovider>().confirmpasswordcontroller,
                hint: 'Confirm Password',
                validator: ((value) => values.confirmpasswords(value)),
                icon: const Icon(Icons.lock)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        );
      },
    );
  }
}
