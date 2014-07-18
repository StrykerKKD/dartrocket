import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import 'core/core.dart' as core_test;

void main(){
  useHtmlEnhancedConfiguration();
  
  group('Core test', core_test.main);
}