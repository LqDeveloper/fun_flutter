import 'package:fun_flutter/reponse/article.dart';
import 'package:fun_flutter/reponse/banner_model.dart';
import 'package:fun_flutter/reponse/category.dart';
import 'package:fun_flutter/reponse/nav_model.dart';
import 'package:fun_flutter/utils/dio_manager.dart';

class AppRequest {
  static Future<List<BannerModel>> getBanners() async {
    var response = await DioManager.instance.get('banner/json');
    return response.data
        .map<BannerModel>((item) => BannerModel.fromJson(item))
        .toList();
  }

  static Future<List<Article>> getTopArticles() async {
    var response = await DioManager.instance.get('article/top/json');
    return response.data
        .map<Article>((item) => Article.fromJson(item))
        .toList();
  }

  static Future<List<Article>> getArticles(int pageNum, {int? cid}) async {
    var response = await DioManager.instance.get('article/list/$pageNum/json',
        queryParameters: (cid == null ? null : {'cid': cid}));
    return response.data["datas"]
        .map<Article>((item) => Article.fromJson(item))
        .toList();
  }

  static Future<List<Category>> getTreeCategory() async {
    var response = await DioManager.instance.get('project/tree/json');
    return response.data
        .map<Category>((item) => Category.fromJson(item))
        .toList();
  }

  static Future<List<Category>> getStructureCategory() async {
    var response = await DioManager.instance.get('tree/json');
    return response.data
        .map<Category>((item) => Category.fromJson(item))
        .toList();
  }

  static Future<List<Category>> getWXCategory() async {
    var response = await DioManager.instance.get('wxarticle/chapters/json');
    return response.data
        .map<Category>((item) => Category.fromJson(item))
        .toList();
  }

  static Future<List<NavModel>> getNavCategory() async {
    var response = await DioManager.instance.get('navi/json');
    return response.data
        .map<NavModel>((item) => NavModel.fromJson(item))
        .toList();
  }
}
