class BaseResponse<T> {
  //head
  final HeadType head;

  //数据
  final T body;

  BaseResponse({
    required this.head,
    required this.body,
  });

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write('{');
    buffer.write('"head":$head');
    buffer.write('"body":"$body"');
    buffer.write('}');
    return super.toString();
  }
}

class HeadType {
  // 状态码
  final String code;

  // 错误信息
  final dynamic fieldErrs;

  // 状态信息
  final String message;

  HeadType({
    required this.code,
    required this.fieldErrs,
    required this.message,
  });

  @override
  String toString() {
    StringBuffer buffer = StringBuffer();
    buffer.write('{');
    buffer.write('"code":$code');
    buffer.write('"fieldErrs":"$fieldErrs"');
    buffer.write('"message":"$message"');
    buffer.write('}');
    return super.toString();
  }
}
