import 'package:flutter/material.dart';
import 'package:myapp/model/restaurants.dart';
import 'package:myapp/ui/_core/widgets/appbar.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class DishScreen extends StatefulWidget {
  final Dish dish;
  final Restaurants restaurant;
  const DishScreen({super.key, required this.dish, required this.restaurant});

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: widget.restaurant.name),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/${widget.dish.imagePath}'),
            Text(widget.dish.name),
            Text("R\$${widget.dish.price.toStringAsFixed(2)}"),
            Text(widget.dish.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:
                      quantity > 1 ? () => setState(() => quantity--) : null,
                  icon: Icon(Icons.remove),
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 🛒 Botão de adicionar ao carrinho
            ElevatedButton(
              onPressed: () {
                final dishes = List.generate(quantity, (_) => widget.dish);
                context.read<BagProvider>().addAllDishes(dishes);
              },
              child: Text("Adicionar $quantity ao carrinho"),
            ),
          ],
        ),
      ),
    );
  }
}
