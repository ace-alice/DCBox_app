# DCBox

A new DCBox Flutter project.

## 關於圖片
- 因避免馬甲包出現敏感圖片而下架，故app使用base64圖片，圖片為代碼自動建立，使用python3製作
- 使用方式
    1. 將圖片放入**assets/image**底下，請依類型分類至第三層資料夾，如果沒有符合的類型請添加新的資料夾，
       資料夾與檔案名稱請遵守蛇式命名法蛇式命名法，英文請全部**小寫**，空白使用**底線**替代

       ex: **assets/image/common/google_auth_logo.png**

    2. 直接建立 terminal在flutter專案資料夾下鍵入
       **python3 tools/encode_image.py**

    3. 腳本執行後可使用，**AppImage**.資料夾名稱.圖片名稱，在代碼內會轉成變為代碼使用的駝峰式命名，且import改使用相對位置，避面馬甲包自動建構出現問題

       ex: widget使用 **AppImage.appBanner.bgBanner1()**
       widget 是一定會有的 如果有問題請看log

       ex: image使用 **AppImage.appBanner.icCustomerServiceImage()**
       image 是可能有可能沒有，部分情況使用前請先解包

       ex: import **import '../../generated/app_image/app_image.dart';**
