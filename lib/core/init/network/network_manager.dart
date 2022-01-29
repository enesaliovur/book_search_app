import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../exception/env_not_found.dart';

// Google API servisi ile iletişimin yönetildiği sınıf 
class NetworkManager {
  
  static NetworkManager? _instance;
  late final Dio dio;
  final String _baseUrl = 'BASE_URL';
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();  
    return _instance!;
  }

  NetworkManager._init() {
    final url = dotenv.env[_baseUrl];
    if (url != null) {
      dio = Dio(BaseOptions(baseUrl: url));   
    } else {
      throw EnvNotFound(value: _baseUrl);
    }
  }
}
