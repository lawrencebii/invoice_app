import 'package:flutter/material.dart';
import 'package:invoice_app/features/authentication/authentication_provider.dart';
import 'package:invoice_app/features/authentication/components/custom_btn.dart';
import 'package:invoice_app/features/authentication/components/custom_field.dart';
import 'package:invoice_app/features/authentication/views/create_account.dart';
import 'package:invoice_app/features/navigation/views/navigation.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/constants.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LocalAuthenticationProvider>().setErrorMessage(null);
      context.read<LocalAuthenticationProvider>().setIsloading(false);
    });
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var spaceY = SizedBox(
      height: pH(20, context),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<LocalAuthenticationProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spaceY,
                    const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Manage all your invoices",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff4F4F4F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ...[
                      spaceY,
                      spaceY,
                      if (provider.errorMessage != null)
                        Text(
                          provider.errorMessage.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.redAccent.withOpacity(0.5),
                          ),
                        ),
                      spaceY,
                      spaceY
                    ],
                    SizedBox(
                      height: pH(20, context),
                    ),
                    TextFormFieldCustom(
                      keyboardType: TextInputType.text,
                      backgroundColor: ColorsConstants.profileInputbackround
                          .withOpacity(0.1),
                      width: pW(340, context),
                      height: pH(70, context),
                      prefixIcon: null,
                      hintText: "Email address",
                      controller: provider.emailController,
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter the email address"
                            : null;
                      },
                      onChanged: (text) {
                        setState(() {
                          // name = text;
                        });
                      },
                    ),
                    SizedBox(
                      height: pH(20, context),
                    ),
                    TextFormFieldCustom(
                      keyboardType: TextInputType.text,
                      backgroundColor: ColorsConstants.profileInputbackround
                          .withOpacity(0.1),
                      width: pW(340, context),
                      height: pH(70, context),
                      suffixIcon: const Icon(Icons.visibility),
                      hintText: "Password",
                      controller: provider.passwordController,
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter the full name"
                            : null;
                      },
                      onChanged: (text) {
                        setState(() {
                          // name = text;
                        });
                      },
                    ),
                    SizedBox(
                      height: pH(40, context),
                    ),
                    provider.loading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            label: "Login",
                            pressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<LocalAuthenticationProvider>()
                                    .loginUser(context);
                              }
                            },
                          ),
                    SizedBox(
                      height: pH(20, context),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CreateAccount()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Do not have an account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
