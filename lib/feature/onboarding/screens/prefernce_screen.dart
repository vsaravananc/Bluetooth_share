import 'dart:async';

import 'package:bluetooh_share/core/data/sharedpreference_data.dart';
import 'package:bluetooh_share/core/routes/route_config.dart';
import 'package:bluetooh_share/core/theme/theme_extenstin.dart';
import 'package:bluetooh_share/core/util/app_constant.dart';
import 'package:bluetooh_share/core/util/dependency_injection.dart';
import 'package:bluetooh_share/feature/onboarding/widgets/image_select.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrefernceScreen extends StatefulWidget {
  const PrefernceScreen({super.key});

  @override
  State<PrefernceScreen> createState() => _PrefernceScreenState();
}

class _PrefernceScreenState extends State<PrefernceScreen> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Spacer(flex: 1),
              const ImageSelect(),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _nameController,
                  style: context.titleMedium,
                  decoration: const InputDecoration(
                    hintText: "Enter Your Name",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: _validateAndContinue,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: context.theme.primaryColor,
                  minimumSize: const Size.fromHeight(55),
                ),
                child: Text("Continue", style: context.titleMedium),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndContinue() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final String name = _nameController.text.trim();
    unawaited(getIt.get<SharedpreferenceData>().set(USER_NAME, name));
    context.go(RouteConfig.send);
  }
}
