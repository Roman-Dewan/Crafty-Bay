import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/providers/bottom_nav_provider.dart';
import '../widgets/cart_widget.dart';
import '../widgets/selected_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const String name = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final isPushed = ModalRoute.of(context)?.settings.name == CartScreen.name;

    return PopScope(
      canPop: isPushed,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _onTapBackButton();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            onPressed: _onTapBackButton,
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(context.l10n.cart),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SelectedCard(),
                  );
                },
              ),
            ),
            CartBottomWidget(price: 2000, onTapCheckout: () {}),
          ],
        ),
      ),
    );
  }

  void _onTapBackButton() {
    final isPushed = ModalRoute.of(context)?.settings.name == CartScreen.name;
    if (isPushed) {
      Navigator.pop(context);
    } else {
      context.read<BottomNavProvider>().moveToHomeScreen();
    }
  }
}
