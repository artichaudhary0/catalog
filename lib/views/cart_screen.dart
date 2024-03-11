import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedProducts;

  const CartScreen({Key? key, required this.selectedProducts})
      : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var product in widget.selectedProducts) {
      totalPrice += product['price'];
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.selectedProducts.length,
              itemBuilder: (context, index) {
                final product = widget.selectedProducts[index];
                return ListTile(
                  leading: Image.network(
                    product['image'],
                    width: 50,
                    height: 50,
                  ),
                  title: Text(
                    product['name'],
                  ),
                  subtitle: Text(
                    'Price: \$${product['price']}',
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.selectedProducts.removeWhere(
                            (item) => item['name'] == product['name']);
                      });
                    },
                    icon: const Icon(
                      Icons.highlight_remove_rounded,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: Colors.red.shade400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Price:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ ${calculateTotalPrice()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
