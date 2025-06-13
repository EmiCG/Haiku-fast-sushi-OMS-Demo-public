import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<dynamic> products = [];
  List<dynamic> cart = []; // Lista para almacenar los productos en el carrito
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/menu'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        setState(() {
          products =
              json['data']; // Asegúrate de que el backend envíe un campo "data"
          isLoading = false;
        });
      } else {
        showError('Error al cargar los productos: ${response.statusCode}');
      }
    } catch (e) {
      showError('Error de conexión o formato: $e');
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void addToCart(dynamic product) {
    setState(() {
      cart.add(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['nombre']} agregado al carrito')),
    );
  }

  void viewCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(cart: cart, onRemove: removeFromCart),
      ),
    );
  }

  void removeFromCart(dynamic product) {
    setState(() {
      cart.remove(product);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['nombre']} eliminado del carrito')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú de Compras'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: viewCart, // Navegar a la vista del carrito
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : products.isEmpty
              ? Center(child: Text('No hay productos disponibles'))
              : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['nombre'] ?? 'Sin nombre',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(product['descripcion'] ?? 'Sin descripción'),
                          Text('Precio: \$${product['precio']}'),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              addToCart(product);
                            },
                            child: Text('Agregar al Carrito'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final List<dynamic> cart;
  final Function(dynamic) onRemove;

  CartScreen({required this.cart, required this.onRemove});

  void completePurchase(BuildContext context) {
    // Aquí puedes implementar la lógica para completar la compra
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Compra completada con éxito')));
    Navigator.pop(context); // Regresa al menú después de completar la compra
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carrito de Compras')),
      body:
          cart.isEmpty
              ? Center(child: Text('El carrito está vacío'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final product = cart[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(product['nombre']),
                            subtitle: Text('Precio: \$${product['precio']}'),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                onRemove(
                                  product,
                                ); // Llama a la función para eliminar el producto
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        completePurchase(context);
                      },
                      child: Text('Terminar Compra'),
                    ),
                  ),
                ],
              ),
    );
  }
}
