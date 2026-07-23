import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:oz_flutter/core/models/advertisement.dart';
import 'package:oz_flutter/core/models/brand.dart';
import 'package:oz_flutter/core/models/paginated.dart';
import 'package:oz_flutter/core/models/user.dart';

Map<String, dynamic> _readJson(String path) =>
    jsonDecode(File(path).readAsStringSync()) as Map<String, dynamic>;

dynamic _readRaw(String path) =>
    jsonDecode(File(path).readAsStringSync());

void main() {
  group('Paginated<Advertisement> — cars_page1 fixture', () {
    final json = _readJson('test/fixtures/cars_page1.json');
    final page = Paginated<Advertisement>.fromJson(
      json,
      (j) => Advertisement.fromJson(j as Map<String, dynamic>),
    );

    test('parses page metadata', () {
      expect(page.results.length, 10);
      expect(page.count, greaterThan(0));
      expect(page.next, 2);
    });

    test('first result has sane brand/model', () {
      final first = page.results.first;
      expect(first.id, greaterThan(0));
      expect(first.brand.name, isNotEmpty);
      expect(first.model.name, isNotEmpty);
    });
  });

  group('Advertisement.fromJson — car_detail fixture', () {
    test('carries description or characteristics', () {
      final json = _readJson('test/fixtures/car_detail.json');
      final ad = Advertisement.fromJson(json);
      expect(
        ad.description != null || ad.characteristics != null,
        isTrue,
      );
    });
  });

  group('Brand list — brands fixture', () {
    test('parses to List<Brand>', () {
      final raw = _readRaw('test/fixtures/brands.json') as List<dynamic>;
      final brands =
          raw.map((e) => Brand.fromJson(e as Map<String, dynamic>)).toList();
      expect(brands.length, greaterThan(0));
      expect(brands.first.name, isNotEmpty);
    });
  });

  group('User.fromJson — login fixture', () {
    test('parses token and phone', () {
      final json = _readJson('test/fixtures/login.json');
      final user = User.fromJson(json);
      expect(user.token, isNotNull);
      expect(user.token!.length, 40);
      expect(user.phone, '996700990099');
    });
  });
}
