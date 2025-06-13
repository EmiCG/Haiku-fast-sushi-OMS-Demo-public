import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DashboardScreen extends StatelessWidget {
  Future<void> logout(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/logout'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success']) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(data['message'])));
          Navigator.pushReplacementNamed(context, '/login');
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Error al cerrar sesión')));
        }
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error al cerrar sesión')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error de conexión con el servidor')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Panel de Administración'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: Text('Cerrar Sesión'),
                      content: Text(
                        '¿Estás seguro de que deseas cerrar sesión?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            logout(context);
                          },
                          child: Text('Cerrar Sesión'),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.2,
                children: [
                  _buildDashboardButton(
                    context,
                    icon: Icons.shopping_cart,
                    label: 'Productos',
                    route: '/products', // Navega a la vista de productos
                  ),
                  _buildDashboardButton(
                    context,
                    icon: Icons.receipt,
                    label: 'Pedidos',
                    route: '/orders', // Navega a la vista de pedidos
                  ),
                  _buildDashboardButton(
                    context,
                    icon: Icons.settings,
                    label: 'Ajustes',
                    route: null,
                  ),
                  _buildDashboardButton(
                    context,
                    icon: Icons.lock,
                    label: 'Apertura/Cierre',
                    route: null,
                  ),
                  _buildDashboardButton(
                    context,
                    icon: Icons.local_offer,
                    label: 'Promociones',
                    route: null,
                  ),
                  _buildDashboardButton(
                    context,
                    icon: Icons.bar_chart,
                    label: 'Reportes',
                    route: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    String? route,
  }) {
    return ElevatedButton(
      onPressed:
          route != null
              ? () {
                Navigator.pushNamed(context, route);
              }
              : null,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 6),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
