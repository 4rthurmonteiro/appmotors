import 'dart:io';

String fixture(String name) =>
    File('test/fixtures/data/$name').readAsStringSync();
