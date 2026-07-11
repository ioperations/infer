public class RedundantReturnValue {

  static int globalState = 0;

  // sub-function depends on global variable
  static int computeFromGlobal() {
    if (globalState > 0) {
      return globalState * 2;
    } else if (globalState < 0) {
      return -1;
    } else {
      return 0;
    }
  }

  // Should NOT warn: different branches return different values
  //   path 1: returns computeFromGlobal() (non-deterministic from checker's POV)
  //   path 2: returns 0 (default fallback)
  static int process(int flag) {
    if (flag == 1) {
      return computeFromGlobal();
    }
    return 0;
  }

  // Should NOT warn: same structure but with two branch-dependent returns
  static int process2(int flag) {
    if (flag == 1) {
      return computeFromGlobal();
    } else if (flag == 2) {
      return computeFromGlobal();
    }
    return 0;
  }

  // Should warn: all paths return the same constant 42
  static int alwaysFortyTwo(int x) {
    if (x > 0) {
      return 42;
    } else {
      return 42;
    }
  }

  // Should warn: all paths return the same constant 0
  static int alwaysZero(int x, int y) {
    if (x > 0) {
      return 0;
    } else if (y > 0) {
      return 0;
    } else {
      return 0;
    }
  }

  // Should NOT warn: default fallback 0 vs branch returning computed value
  static int fallbackVsCompute(int mode) {
    switch (mode) {
      case 1:
        return computeFromGlobal();
      case 2:
        return globalState + 1;
      default:
        return 0;
    }
  }

  // Should NOT warn: single return, not enough paths
  static int singleReturn() {
    return 42;
  }

  // Should NOT warn: void return type
  static void voidFunc() {
    System.out.println("no return value");
  }
}
