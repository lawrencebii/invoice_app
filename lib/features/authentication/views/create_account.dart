import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/features/authentication/authentication_provider.dart';
import 'package:invoice_app/features/authentication/components/custom_btn.dart';
import 'package:invoice_app/utils/colors.dart';
import 'package:invoice_app/utils/constants.dart';
import 'package:invoice_app/utils/petite_storage.dart';
import 'package:provider/provider.dart';

import '../../navigation/views/navigation.dart';
import '../components/custom_field.dart';
import 'login_page.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String phone = '';
  var _selectedCountryPhoneCode = "";
  var _selectedCountryHint = "";
  var _selectedFlag = '';

  Country _selectedCountry = Country.from(json: kenyaObj);

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _selectedCountry = Country.from(json: kenyaObj);
      });
      context.read<LocalAuthenticationProvider>().setErrorMessage(null);
      context.read<LocalAuthenticationProvider>().setIsloading(false);
    });
    super.initState();
  }

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
                      "Create an account",
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
                      "Sign up to be part of this service now",
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
                    TextFormFieldCustom(
                      keyboardType: TextInputType.text,
                      backgroundColor: ColorsConstants.profileInputbackround
                          .withOpacity(0.1),
                      width: pW(340, context),
                      height: pH(70, context),
                      prefixIcon: null,
                      hintText: "Full Name.",
                      controller: provider.nameController,
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
                        hintText: "720 400 004",
                        controller: provider.phoneController,
                        keyboardType: TextInputType.number,
                        validator: (value) => value!.isEmpty
                            ? "Please enter phone"
                            : value.length != 9
                                ? "Enter valid number"
                                : null,
                        backgroundColor: ColorsConstants.profileInputbackround
                            .withOpacity(0.1),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: InkWell(
                            onTap: () {
                              // Country defaultCountry=Country(phoneCode: '254', countryCode: '254', e164Sc: e164Sc, geographic: geographic, level: level, name: name, example: example, displayName: displayName, displayNameNoCountryCode: displayNameNoCountryCode, e164Key: e164Key);
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,

                                // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  setState(
                                    () {
                                      if (country.phoneCode.toString() ==
                                          "254") {
                                        _selectedCountry = country;
                                        _selectedCountryPhoneCode =
                                            '+${country.phoneCode}';
                                        _selectedCountryHint = country.example;
                                        _selectedFlag = countryCodeToEmojiLocal(
                                            '+${country.phoneCode}');
                                        print(_selectedCountry.toString());
                                      } else {
                                        showSnack(context,
                                            "Selected country is not currently supported by the system");
                                      }

                                      // _selectedCountryPhoneCode = '+${country.phoneCode}';
                                      // _selectedCountryHint = country.example;
                                    },
                                  );
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // if (_selectedCountry != null)
                                CircleAvatar(
                                  radius: 12,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: flagImage(_selectedCountry)),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  // "+$_selectedCountryPhoneCode ",
                                  // _selectedCountry != null
                                  //     ?
                                  "+${_selectedCountry.phoneCode}",
                                  // : "+1",
                                  style: const TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 1.0),
                              ],
                            ),
                          ),
                        ),
                        // },

                        onChanged: (phoneVal) {
                          setState(() {
                            phone = phoneVal;
                          });
                        }),
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
                      hintText: "Address",
                      controller: provider.addressController,
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter your address"
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
                    TextFormFieldCustomPass(
                      keyboardType: TextInputType.text,
                      backgroundColor: ColorsConstants.profileInputbackround
                          .withOpacity(0.1),
                      width: pW(340, context),
                      height: pH(70, context),
                      suffixIcon: const Icon(Icons.visibility),
                      hintText: "Password ",
                      obscuringCharacter: '*',
                      obscureText: true,
                      controller: provider.passwordController,
                      validator: (value) {
                        return value!.isEmpty
                            ? "Please enter the password"
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
                            label: "Create Account",
                            pressed: () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<LocalAuthenticationProvider>()
                                    .signUp(context);
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
                              builder: (context) => const LoginScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Already have an account?",
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
