import 'package:flutter/material.dart';
import '/http_service.dart';

class EditProductScreen extends StatelessWidget {
  final int productId;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final HttpService httpService = HttpService();

  EditProductScreen({required this.productId});

  Future<void> _editProduct(BuildContext context) async {
    final String name = nameController.text;
    final String description = descriptionController.text;
    final double? price = double.tryParse(priceController.text);

    if (name.isEmpty || description.isEmpty || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    try {
      final response = await httpService.dio.put(
        '/admin/productos/edit/$productId',
        data: {'nombre': name, 'descripcion': description, 'precio': price},
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Producto actualizado exitosamente')),
        );
        Navigator.pop(context);
      } else {
        throw Exception('Error al actualizar el producto');
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nombre del Producto'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Precio'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _editProduct(context),
              child: Text('Actualizar Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
