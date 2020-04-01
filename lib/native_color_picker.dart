library native_color_picker;

export 'src/unsupported.dart'
    if (dart.library.html) 'src/web.dart';

const version = '1.0.0';
