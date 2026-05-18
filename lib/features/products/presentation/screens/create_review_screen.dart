import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/utils/validators.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});
  static const String name = '/create_review';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(context.l10n.createReview),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: [
                TextFormField(
                  controller: firstNameController,
                  validator: (value) => Validators.validatorText(
                    value,
                    msg: context.l10n.firstNameRequired,
                  ),
                  decoration: InputDecoration(hintText: context.l10n.firstName),
                ),
                TextFormField(
                  validator: (value) => Validators.validatorText(
                    value,
                    msg: context.l10n.lastNameRequired,
                  ),
                  controller: lastNameController,
                  decoration: InputDecoration(hintText: context.l10n.lastName),
                ),
                TextFormField(
                  maxLines: 5,
                  controller: reviewController,
                  validator: (value) => Validators.validatorText(
                    value,
                    msg: context.l10n.reviewRequired,
                  ),
                  decoration: InputDecoration(
                    hintText: context.l10n.writeReview,
                    contentPadding: EdgeInsets.only(
                      top: 12,
                      left: 12,
                      right: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () => _submitForm(),
                  child: Text(context.l10n.submit),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Review submitted successfully")));
    }
  }
}
