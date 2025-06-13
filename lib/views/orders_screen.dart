import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<dynamic> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://127.0.0.1:8000/admin/pedidos',
        ), // Cambia según tu entorno
      );

      if (response.statusCode == 200) {
        setState(() {
          orders = jsonDecode(response.body)['data'];
          isLoading = false;
        });
      } else {
        showError('Error al cargar los pedidos: ${response.statusCode}');
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
      appBar: AppBar(title: Text('Gestión de Pedidos')),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : orders.isEmpty
              ? Center(child: Text('No hay pedidos disponibles'))
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pedido #${order['id']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Cliente: ${order['nombre_cliente']}'),
                          Text('Teléfono: ${order['telefono_cliente']}'),
                          Text(
                            'Dirección: ${order['direccion_cliente_escrita']}',
                          ),
                          Text('Estado de Pago: ${order['estado_pago']}'),
                          Text(
                            'Estado de Producción: ${order['estado_produccion']}',
                          ),
                          Text('Total: \$${order['total']}'),
                          SizedBox(height: 8),
                          Text('Productos:'),
                          ...(order['productos'] as List<dynamic>).map((
                            product,
                          ) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '- ${product['nombre']} (Cantidad: ${product['cantidad']}, Precio: \$${product['precio']})',
                              ),
                            );
                          }).toList(),
                          SizedBox(height: 16),
                          // Botón para cambiar el estado del pedido
                          ElevatedButton(
                            onPressed: () {
                              // Sin funcionalidad, solo representativo
                            },
                            child: Text('Cambiar Estado'),
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
