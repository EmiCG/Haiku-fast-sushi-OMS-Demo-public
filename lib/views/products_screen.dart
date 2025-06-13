import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<dynamic> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/admin/productos'),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        setState(() {
          products = json['data'];
          isLoading = false;
        });
      } else {
        showError('Error al cargar los productos: ${response.statusCode}');
      }
    } catch (e) {
      showError('Error de conexión o formato: $e');
    }
  }

  Future<void> deleteProduct(int productId) async {
    try {
      final response = await http.delete(
        Uri.parse('http://127.0.0.1:8000/admin/productos/delete/$productId'),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Producto eliminado exitosamente')),
        );
        fetchProducts(); // Recargar la lista
      } else {
        showError('Error al eliminar el producto: ${response.statusCode}');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Productos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/products/create').then((_) {
                fetchProducts(); // Recargar la lista después de crear un producto
              });
            },
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
                    child: ListTile(
                      title: Text(product['nombre'] ?? 'Sin nombre'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product['descripcion'] ?? 'Sin descripción'),
                          Text('Precio: \$${product['precio']}'),
                          Text('Creado: ${product['created_at']}'),
                          Text('Actualizado: ${product['updated_at']}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/products/edit',
                                arguments: product['id'],
                              ).then((_) {
                                fetchProducts(); // Recargar la lista después de editar
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              deleteProduct(product['id']);
                            },
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
