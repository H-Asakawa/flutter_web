import 'package:flutter_web_ui/ui.dart' as ui;
import "package:asakawa_presentation/main.dart" as app;
import 'package:intl/date_symbol_data_local.dart';

main() async {
  await ui.webOnlyInitializePlatform();
  app.main();
  initializeDateFormatting('ja');
}
