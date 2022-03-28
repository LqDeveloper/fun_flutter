import 'package:flutter/material.dart';
import 'package:fun_flutter/utils/app_setting.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {
  static final List<Locale> locals = [
    Get.deviceLocale ?? const Locale("zh", "CN"),
    const Locale("zh", "CN"),
    const Locale("en", "US")
  ];

  static Locale get initLocal => locals[AppSetting.langIndex];

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        _ZhCNValues.key: _ZhCNValues.values,
        _EnUSValues.key: _EnUSValues.values
      };
}

abstract class _ZhCNValues {
  static const key = "zh_CN";
  static Map<String, String> values = {
    "home": "首页",
    "project": "项目",
    "wechat": "公众号",
    "structure": "体系",
    "me": "我的",
    "refresh": "下拉刷新",
    "loadMore": "加载更多",
    "top": "置顶",
    "type": "体系",
    "nav": "导航",
    "click_login": "点击登录",
    "save": "收藏",
    "dark_mode": "暗黑模式",
    "color": "色彩主题",
    "setting": "设置",
    "update": "检查更新",
    "releaseText": "下拉刷新",
    "refreshingText": "下拉刷新中",
    "completeText": "刷新完成",
    "idleText": "上拉加载更多",
    "loadingText": "上拉加载中",
    "is_latest": "当前是最新版本",
    "ok": "确定",
    "clear_cache": "清空缓存",
    "font": "字体",
    "language": "语言",
    "score": "评分",
    "feedback": "反馈",
    "system": "跟随系统",
    "happy_font": "快乐字体",
    "zh": "简体中文",
    "english": "英文",
    "cancel": "取消",
    "please_login": "请登录",
    "user_name": "用户名",
    "password": "密码",
    "user_name_not_empty": "账号不能为空",
    "pwd_not_empty": "密码不能为空",
    "pwd_at_least_6" : "密码最少6个字符",
    "Sign_In" : "登录",
    "not_has_account":"还没有账号? ",
    "go_register":"去注册",
    "Sign_up":"注册"
  };
}

abstract class _EnUSValues {
  static const key = "en_US";
  static Map<String, String> values = {
    "home": "Home",
    "project": "Project",
    "wechat": "Wechat",
    "structure": "Structure",
    "me": "Me",
    "refresh": "Refresh",
    "loadMore": "LoadMore",
    "top": "Top",
    "type": "Structure",
    "nav": "Navigation",
    "click_login": "Sign In",
    "save": "Like",
    "dark_mode": "Dark Mode",
    "color": "Theme",
    "setting": "Setting",
    "update": "Update",
    "releaseText": "pull to refresh",
    "refreshingText": "refreshing",
    "completeText": "refreshed",
    "idleText": "load more",
    "loadingText": "loading more",
    "is_latest": "Curren version is latest",
    "ok": "Ok",
    "clear_cache": "Clear Cache",
    "font": "Font",
    "language": "Language",
    "score": "Score",
    "feedback": "Feedback",
    "system": "System",
    "happy_font": "ZCOOL KuaiLe",
    "zh": "Chinese",
    "english": "English",
    "cancel": "Cancel",
    "please_login": "Please Sign in",
    "user_name": "User Name",
    "password": "Password",
    "user_name_not_empty": "User name not empty",
    "pwd_not_empty": "Password name not empty",
    "pwd_at_least_6" : "Password must be at least 6 characters",
    "Sign_In" : "Sign In",
    "not_has_account":"do not has account? ",
    "go_register":"Sign up",
    "Sign_up":"Sign up"
  };
}
