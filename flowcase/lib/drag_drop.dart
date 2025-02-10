import 'package:flutter/material.dart';

import 'main.dart' show showUndoSnackbar;

class DragDropDemo extends StatefulWidget {
  const DragDropDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DragDropDemoState();
  }
}

class Product {
  final String productName;
  final Icon categoryIcon;
  final String imageName;
  late Image image;
  final double price;

  Product(this.productName, this.categoryIcon, this.imageName, this.price) {
    image = Image.asset(imageName);
  }
}

List<Product> products = [
  Product("Framework Laptop", const Icon(Icons.laptop), "images/FrameworkLaptop.png", 1000.00),
  Product("HP Deskjet Printer", const Icon(Icons.print), "images/HP_Printer.png", 257.99),
  Product("Network Switch", const Icon(Icons.device_hub), "images/NetworkSwitch.png", 59.55),
];

class _DragDropDemoState extends State<DragDropDemo> {
  List<Product> cartItems = [];
  final GlobalKey _draggableKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text("Long-press and drag an item to the yellow zone",)
          ),
          Column(
            children: products.map((product) {
              return LongPressDraggable<Product>(
                  data: product,
                  dragAnchorStrategy: pointerDragAnchorStrategy,
                  feedback: DraggingProduct(
                    dragKey: _draggableKey,
                    photoProvider: product.image.image,
                  ),
                  child:ListTile(
                    leading: product.categoryIcon,
                    title: SizedBox(
                      height:96,
                      child: Image.asset(product.imageName),
                    ),
                    subtitle: Center(child: Text(product.productName)),
                  ));
            }).toList(),
          ),
          DragTarget<Product>(
            builder: (context, candidateItems, rejectedItems) {
              return SizedBox(
                height: 100,
                width: 400,
                child: Card(
                  color: Colors.yellowAccent,
                  child: Center(
                    child: Text("Cart contains ${cartItems.length} items worth ${_totalValue(cartItems)}",
                        style: Theme.of(context).textTheme.headlineSmall
                    ),
                  ),
                ),
              );
            },
            onAccept: (product) {
              _productDroppedOnShoppingCart(product: product);
            },
          ),
        ]
    );
  }

  double _totalValue(list) {
    double total = 0.0;
    for (Product p in list) {
      total += p.price;
    }
    return total;
  }
  void _productDroppedOnShoppingCart({required Product product}) {
    setState(() {
      cartItems.add(product);
    });
    showUndoSnackbar(context, "Added ${product.productName}",
      () => setState(() => cartItems.remove(product)));
  }
}

/// Display the product as it's being dragged.
/// Borrowed from official docs (under Creative Commons)
/// https://docs.flutter.dev/cookbook/effects/drag-a-widget
class DraggingProduct extends StatelessWidget {
  const DraggingProduct({
    super.key,
    required this.dragKey,
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 150,
          width: 150,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
