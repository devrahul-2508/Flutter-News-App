import 'package:dio/dio.dart';

class DioClient {
 
 final Dio dio = Dio(BaseOptions(responseType: ResponseType.plain));    
  
}
