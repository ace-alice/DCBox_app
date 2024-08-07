import base64
import json
import os

root_path = './assets/images'
generated_dir_path = './lib/generated/'
app_image_path = './lib/generated/app_image/'
files = os.listdir(root_path)

progressCount = 0

first = dict()

if os.path.isdir(generated_dir_path):
    pass
else:
    os.mkdir(generated_dir_path)

if os.path.isdir(app_image_path):
    pass
else:
    os.mkdir(app_image_path)


def snack_converter_camel_case(text: str) -> str:
    init, *temp = text.split('_')
    result = ''.join([init.lower(), *map(str.title, temp)])
    return result


def snack_converter_pascal_case(text: str) -> str:
    result = text.replace('_', ' ').title().replace(' ', '')
    return result


fetchImageCode = '''

mixin FetchImage {
  final AppLogger _appLogger = Get.find<AppLogger>();
  Widget _getWidget(
    String name, {
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
  }) {
    final map = imageJson[runtimeType.toString()];
    final placeholder = Placeholder(
      fallbackWidth: width ?? 0,
      fallbackHeight: height ?? 0,
    );
    if (map == null) {
      _appLogger.debugger('$runtimeType not found');
      return placeholder;
    }
    final base64Image = map['${name}Image'];
    if (base64Image == null) {
      _appLogger.debugger('$runtimeType $name not found');
      return placeholder;
    }
    try {
      final imageData = base64.decode(base64Image);
      return Image.memory(
        imageData,
        fit: fit,
        width: width,
        height: height,
        gaplessPlayback: true,
      );
    } catch (e) {
      _appLogger.debugger(e.toString());
      return placeholder;
    }
  }

  Uint8List? _getImageData(String name) {
    final map = imageJson[runtimeType.toString()];
    if (map == null) {
      _appLogger.debugger('$runtimeType not found');
      return null;
    }
    final base64Image = map['${name}Image'];
    if (base64Image == null) {
      _appLogger.debugger('$runtimeType $name not found');
      return null;
    }
    try {
      return base64.decode(base64Image);
    } catch (e) {
      _appLogger.debugger(e.toString());
      return null;
    }
  }

  Image? _getImage(
    String name, {
    BoxFit fit = BoxFit.contain,
    double? width,
    double? height,
  }) {
    final imageData = _getImageData(name);
    if (imageData == null) {
      return null;
    }
    try {
      return Image.memory(
        imageData,
        fit: fit,
        width: width,
        height: height,
        gaplessPlayback: true,
      );
    } catch (e) {
      _appLogger.debugger(e.toString());
      return null;
    }
  }

  /// PascalCase
  ///
  /// ex: app_common_icon => AppCommonIcon
  String _snakeCaseConverterToPascalCase(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text
        .split('_')
        .map((e) => e[0].toUpperCase() + e.substring(1))
        .join();
  }

  /// CamelCase
  ///
  /// ex: app_common_icon => appCommonIcon
  String _snackCaseConverterToCamelCase(String text) {
    if (text.isEmpty) {
      return text;
    }
    final pascalCase = _snakeCaseConverterToPascalCase(text);
    return pascalCase[0].toLowerCase() + pascalCase.substring(1);
  }
}

    '''

func_parameter_string = 'BoxFit fit = BoxFit.contain,double? width,double? height,'


def gen_country(data):
    data.write('Widget getImageWith({required String name,' + func_parameter_string + '}) {\n')
    data.write('final pascalCase = _snakeCaseConverterToPascalCase(name.toLowerCase());\n')
    data.write('return _getWidget(\'ic$pascalCase\', fit:fit, width:width, height:height,);\n}\n')


def gen_currency(data):
    data.write('Widget getImageWith({required String name,' + func_parameter_string + '}) {\n')
    data.write('final pascalCase = _snakeCaseConverterToPascalCase(name.toLowerCase());\n')
    data.write('return _getWidget(\'ic$pascalCase\', fit:fit, width:width, height:height,);\n}\n')


def gen_banner(data):
    data.write('Widget getImageWith({required String name,' + func_parameter_string + '}) {\n')
    data.write('final pascalCase = _snackCaseConverterToCamelCase(name);\n')
    data.write('return _getWidget(pascalCase, fit:fit, width:width, height:height,);\n}\n')


def gen_app_image(map):
    data = open(app_image_path + 'app_image.dart', 'w+')
    data.write('import \'package:flutter/material.dart\';')
    data.write('import \'../../common/utils/index.dart\';')
    data.write('import \'package:get/get.dart\';')
    data.write('import \'dart:convert\';')
    data.write('import \'dart:typed_data\';')
    data.write('import \'image_json.dart\';')
    data.write('class AppImage {')
    for key in map:
        name = key[0].lower() + key[1:]
        data.write('static ' + 'final ' + name + ' = ' + key + '();')

    data.write('}')
    for key, content in map.items():
        data.write('class ' + key + ' with FetchImage {\n')

        if 'Currency' in key:
            gen_currency(data)

        elif 'AppBanner' in key:
            gen_banner(data)

        elif 'Country' in key:
            gen_banner(data)

        for key in content:
            data.write(
                'Widget ' + key.replace('Image', '') + '({' + func_parameter_string + '}) {\n')
            data.write('return _getWidget(\'' + key.replace('Image',
                                                            '') + '\', fit:fit, width:width, height:height,);\n}')

            data.write('Image? ' + key + '({' + func_parameter_string + '}) {\n')
            data.write('return _getImage(\'' + key.replace('Image',
                                                           '') + '\', fit:fit, width:width, height:height,);\n}')

            data.write('Uint8List? ' + key.replace('Image', 'ImageData') + '() {\n')
            data.write('return _getImageData(\'' + key.replace('Image', '') + '\',);\n}')

        data.write('}')

    data.write(fetchImageCode)


def gen_json(map):
    data = open(app_image_path + 'image_json.dart', 'w+')
    data.write('const imageJson = ' + json.dumps(map) + ';')


def converter_base64_image(path: str) -> str:
    with  open(path, "rb") as f:
        return base64.b64encode(f.read()).decode('utf-8')


for file in files:
    subPath = root_path + '/' + file
    if os.path.isdir(subPath):
        dir = dict()
        subFiles = os.listdir(subPath)

        for subFile in subFiles:
            if "png" in subFile:
                progressCount += 1
                path = subPath + '/' + subFile
                file_name = subFile.split('.')[0]
                dir[snack_converter_camel_case(file_name) + 'Image'] = converter_base64_image(path)

        first[snack_converter_pascal_case(file)] = dir

    elif "png" in file:
        print('請加入資料夾 ' + file)

    gen_json(first)
    gen_app_image(first)

print("total = " + str(progressCount))
