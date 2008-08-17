/* knock.h -- simplistic Knock generator.  */

#ifndef HEADER_KNOCK_H
#define HEADER_KNOCK_H

#define KNOCK_VERSION "0.1"

#include <stdio.h>
#include <stdlib.h>

#define ok(expr, ...)                                                   \
  do {                                                                  \
    if (expr)                                                           \
      {                                                                 \
        if (#__VA_ARGS__[0])                                            \
          printf ("ok - %s\n", "" __VA_ARGS__);                         \
        else                                                            \
          printf ("ok\n");                                              \
      }                                                                 \
    else                                                                \
      {                                                                 \
        if (#__VA_ARGS__[0])                                            \
          printf ("not ok - %s:%d: (%s) %s failed - %s\n",              \
                  __FILE__, __LINE__, __FUNCTION__, # expr, "" __VA_ARGS__); \
        else                                                            \
          printf ("not ok - %s:%d: (%s) %s failed\n",                   \
                  __FILE__, __LINE__, __FUNCTION__, # expr);            \
      }                                                                 \
  } while(0)

#define is(got, expected, ...)                                          \
  do {                                                                  \
    long _got = (got);                                                  \
    long _expected = (expected);                                        \
    if (_expected == _got)                                              \
      {                                                                 \
        if (#__VA_ARGS__[0])                                            \
          printf ("ok - %s\n", "" __VA_ARGS__);                         \
        else                                                            \
          printf ("ok\n");                                              \
      }                                                                 \
    else                                                                \
      {                                                                 \
        if (#__VA_ARGS__[0])                                            \
          printf ("not ok - %s:%d: (%s) %s(%ld, %p) != %s - %s\n",      \
                  __FILE__, __LINE__, __FUNCTION__,                     \
                  # got, _got, (void*) _got, # expected, "" __VA_ARGS__ ); \
        else                                                            \
          printf ("not ok - %s:%d: (%s) %s(%ld, %p) != %s\n",           \
                  __FILE__, __LINE__, __FUNCTION__,                     \
                  # got, _got, (void*) _got, # expected);               \
      }                                                                 \
  } while(0)

#define fail(...)                                                       \
  do {                                                                  \
    if (#__VA_ARGS__[0])                                                \
      printf ("not ok - %s:%d (%s) - %s\n",                             \
              __FILE__, __LINE__, __FUNCTION__, "" __VA_ARGS__);        \
    else                                                                \
      printf ("not ok - %s:%d (%s)\n",                                  \
              __FILE__, __LINE__, __FUNCTION__);                        \
  } while(0)

#define pass(...)  do { ok(1, __VA_ARGS__); } while(0)

#define diag(fmt, args...)  do { printf ("# " fmt "\n" , ##args); } while(0)

#endif /* !defined HEADER_KNOCK_H */
