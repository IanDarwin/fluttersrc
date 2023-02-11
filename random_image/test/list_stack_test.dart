import 'dart:collection';

import 'package:flutter_test/flutter_test.dart';

/// Show that ListQueue works correctly as a Stack
/// when using just add(), removeLast(), and length.
main() {
	test("ListQueue as stack", ()  {
	var stack = ListQueue<int>();
	stack.add(1);
	stack.add(2);
	stack.add(3);
	print(stack);
	expect(3, stack.removeLast());
	expect(2, stack.length);
	expect(2, stack.removeLast());
	expect(1, stack.length);
	expect(1, stack.removeLast());
	expect(0, stack.length);
	});
}

