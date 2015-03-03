library tests;

import "physics/physics_test.dart" as PhysicsTest;
import 'package:unittest/html_enhanced_config.dart';

void main() {
  useHtmlEnhancedConfiguration();

  PhysicsTest.main();
}