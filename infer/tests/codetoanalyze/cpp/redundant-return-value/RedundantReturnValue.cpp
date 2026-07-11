int globalState = 0;

int computeFromGlobal() {
  if (globalState > 0) {
    return globalState * 2;
  } else if (globalState < 0) {
    return -1;
  } else {
    return 0;
  }
}

// Should NOT warn: different branches return different values
int process(int flag) {
  if (flag == 1) {
    return computeFromGlobal();
  }
  return 0;
}

// Should NOT warn: two branches call sub-function, default returns 0
int process2(int flag) {
  if (flag == 1) {
    return computeFromGlobal();
  } else if (flag == 2) {
    return computeFromGlobal();
  }
  return 0;
}

// Should WARN: all paths return 42
int alwaysFortyTwo(int x) {
  if (x > 0) {
    return 42;
  } else {
    return 42;
  }
}

// Should WARN: all paths return 0
int alwaysZero(int x, int y) {
  if (x > 0) {
    return 0;
  } else if (y > 0) {
    return 0;
  } else {
    return 0;
  }
}

// Should NOT warn: default fallback 0 vs branch returning computed value
int fallbackVsCompute(int mode) {
  switch (mode) {
    case 1:
      return computeFromGlobal();
    case 2:
      return globalState + 1;
    default:
      return 0;
  }
}

// Should NOT warn: single return path
int singleReturn() { return 42; }

// Should NOT warn: void return type
void voidFunc() {
  int x = 42;
  (void)x;
}

// Should NOT warn: different constant returns
int branchOnParam(int a, int b) {
  if (a > 0) {
    return 1;
  } else if (b > 0) {
    return 2;
  }
  return 0;
}
class Logger {
 public:
  Logger() {}

 public:
  int _ret{0};
};

#define RET logger._ret
#define I_AM_FUNC_WITH_LOG Logger logger;
#define RETURN_WHEN_ERR   \
  if (logger._ret != 0) { \
    return logger._ret;   \
  }
#define RETURN_SUCCESS return 0;

int testValue(int k) {
  I_AM_FUNC_WITH_LOG;
  if (k % 2) {
    return 100;
  }
  return 50;
}

int k() {
  I_AM_FUNC_WITH_LOG;
  if ( globalState % 3 ) {
    RET = testValue(globalState);
    // RETURN_WHEN_ERR;
    RETURN_SUCCESS;
  }
  RETURN_SUCCESS;
}