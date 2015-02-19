library all_tests;

import "physics/DirectionSystem_test.dart" as DirectionSystem_test;
import 'package:unittest/html_enhanced_config.dart';

void main() {
  useHtmlEnhancedConfiguration();

  DirectionSystem_test.main();
}