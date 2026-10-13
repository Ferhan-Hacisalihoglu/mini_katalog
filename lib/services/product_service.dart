import 'dart:convert';
import 'dart:io';
import '../models/product.dart';

class ProductService {
  static const String apiUrl = 'https://wantapi.com/products.php';

  Future<List<Product>> fetchProducts() async {
    final client = HttpClient();
    try {
      final request = await client.getUrl(Uri.parse(apiUrl));
      final response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        final responseBody = await response.transform(utf8.decoder).join();
        final dynamic decoded = jsonDecode(responseBody);

        if (decoded is Map<String, dynamic> && decoded['data'] is List) {
          final List<dynamic> list = decoded['data'] as List<dynamic>;
          return list
              .map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList();
        } else if (decoded is List) {
          return decoded
              .map((item) => Product.fromJson(item as Map<String, dynamic>))
              .toList();
        } else {
          return [];
        }
      } else {
        throw HttpException('Sunucu yanıt kodu: ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }
}
