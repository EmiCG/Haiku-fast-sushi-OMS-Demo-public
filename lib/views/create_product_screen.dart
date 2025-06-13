import 'package:flutter/material.dart';
import '/http_service.dart';

class CreateProductScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final HttpService httpService = HttpService();

  Future<void> _createProduct(BuildContext context) async {
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
      final response = await httpService.dio.post(
        '/admin/productos/create',
        data: {'nombre': name, 'descripcion': description, 'precio': price},
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Producto creado exitosamente')));
        Navigator.pop(context);
      } else {
        throw Exception('Error al crear el producto');
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
      appBar: AppBar(title: Text('Crear Producto')),
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
              onPressed: () => _createProduct(context),
              child: Text('Crear Producto'),
            ),
          ],
        ),
      ),
    );
  }
}
