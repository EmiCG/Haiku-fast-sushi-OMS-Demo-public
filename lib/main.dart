import 'package:flutter/material.dart';
import 'views/dashboard_screen.dart';
import 'views/products_screen.dart';
import 'views/create_product_screen.dart';
import 'views/edit_product_screen.dart';
import 'views/orders_screen.dart'; // Importa la vista de pedidos
import 'views/menu_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Productos y Pedidos',
      initialRoute: '/', // Inicia en el Dashboard
      routes: {
        '/': (context) => DashboardScreen(),
        '/menu': (context) => MenuScreen(),
        '/products': (context) => ProductsScreen(),
        '/products/create': (context) => CreateProductScreen(),
        '/products/edit':
            (context) => EditProductScreen(
              productId: ModalRoute.of(context)!.settings.arguments as int,
            ),
        '/orders': (context) => OrdersScreen(), // Ruta para la vista de pedidos
      },
    );
  }
}
