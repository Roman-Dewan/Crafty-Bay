import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../shared/presentation/providers/bottom_nav_provider.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../providers/cart_list_provider.dart';
import '../widgets/total_price_and_checkout_section.dart';
import '../widgets/selected_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const String name = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<CartListProvider>().getCarts();
      }
    });
  }

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
        body: Consumer<CartListProvider>(
          builder: (_, provider, _) {
            if (provider.getInProgress) {
              return const CenterCircularWidget();
            }
            if (provider.carts.isEmpty) {
              return Center(child: Text("No items in cart"));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemCount: provider.carts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SelectedCard(cart: provider.carts[index]),
                      );
                    },
                  ),
                ),
                TotalPriceAndCheckoutSection(
                  price: provider.totalPrice,
                  onTapCheckout: () {
                    if (kDebugMode) log(provider.totalPrice.toString());
                  },
                ),
              ],
            );
          },
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
