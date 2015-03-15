library tests;

import 'package:unittest/html_enhanced_config.dart';

//=============================================================================

import 'core/core_test.dart' as CoreTest;
import 'physics/physics_test.dart' as PhysicsTest;

//=============================================================================

void main() {
  useHtmlEnhancedConfiguration();

  CoreTest.main();
  PhysicsTest.main();
}