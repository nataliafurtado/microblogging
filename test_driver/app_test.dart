import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('microblogging', () {
    final buttonNewUser = find.byValueKey('button-new-user');
    final imputTextNewUserName = find.byValueKey('imput-text-new-user-name');
    final imputTextNewUserLogin = find.byValueKey('imput-text-new-user-login');
    final imputTextNewUserPassword =
        find.byValueKey('imput-text-new-user-password');
    final saveNewUserButton = find.byValueKey('save-new-user-button');
    final imputLoginLogin = find.byValueKey('imput-login-login');
    final imputLoginPassword = find.byValueKey('imput-login-password');
    final buttonLoginEnter = find.byValueKey('button-login-enter');
    final listPosts = find.byValueKey('list-posts');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('new user test', () async {
      await driver.runUnsynchronized(() async {
        await driver.waitFor(buttonNewUser);
        await driver.tap(buttonNewUser);
        await driver.waitFor(imputTextNewUserName);
        await Future.delayed(Duration(seconds: 2));
        await driver.tap(imputTextNewUserName);
        await driver.enterText("Logim Teste");
        await driver.tap(imputTextNewUserLogin);
        await driver.enterText("loginTeste");
        await driver.tap(imputTextNewUserPassword);
        await driver.enterText("loginTeste");
        await Future.delayed(Duration(seconds: 2));
        await driver.tap(saveNewUserButton);
      });
    });

    test('make login test', () async {
      await driver.runUnsynchronized(() async {
        await driver.waitFor(buttonNewUser);
        await driver.tap(imputLoginLogin);
        await driver.enterText("loginTeste");
        await driver.tap(imputLoginPassword);
        await driver.enterText("loginTeste");
        await Future.delayed(Duration(seconds: 2));
        await driver.tap(buttonLoginEnter);
        await driver.waitFor(listPosts);
        await Future.delayed(Duration(seconds: 2));
      });
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
