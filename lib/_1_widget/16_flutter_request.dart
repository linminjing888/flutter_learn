import 'package:dio/dio.dart';
import 'package:flutter_learn/_1_widget/16_request_config.dart';

class MJHttpRquest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeout,
  );
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor interceptor}) async {
    final options = Options(method: method);

// 拦截器
    Interceptor dInter = InterceptorsWrapper(
      onRequest: (options) {
        print("请求拦截"); // 一般是添加请求的公共部分，比如添加 token：
        options.headers['token'] = 'token00';
        return options;
      },
      onResponse: (e) {
        print("响应拦截"); // 一般用于通用数据解析等
        return e;
      },
      onError: (e) {
        print("错误拦截"); // 一般用于异常功能处理。
        return e;
      },
    );
    List<Interceptor> inters = [dInter];
    if (interceptor != null) {
      inters.add(interceptor);
    }
    // 统一添加到拦截器中
    dio.interceptors.addAll(inters);

    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
