import 'package:dio/dio.dart';

class HttpService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  String? _csrfToken; // Almacena el token CSRF

  HttpService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Asegúrate de obtener el token CSRF antes de solicitudes protegidas
          if (options.method != 'GET' && options.method != 'OPTIONS') {
            await _ensureCsrfToken();
            if (_csrfToken != null) {
              options.headers['X-XSRF-TOKEN'] = _csrfToken!;
            }
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<void> _ensureCsrfToken() async {
    if (_csrfToken == null) {
      try {
        final response = await _dio.get(
          '/sanctum/csrf-cookie',
          options: Options(headers: {'Accept': 'application/json'}),
        );
        // Laravel almacena el token CSRF en la cookie 'XSRF-TOKEN'
        final cookies = response.headers['set-cookie'];
        if (cookies != null) {
          for (var cookie in cookies) {
            if (cookie.contains('XSRF-TOKEN')) {
              _csrfToken = Uri.decodeComponent(
                cookie.split(';').first.split('=').last,
              );
              break;
            }
          }
        }
        print('CSRF cookie obtenida: $_csrfToken');
      } catch (e) {
        print('Error al obtener el token CSRF: $e');
        rethrow;
      }
    }
  }

  Dio get dio => _dio;
}
