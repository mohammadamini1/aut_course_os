#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include <stddef.h>

// new
#define PGSIZE 4096

struct ptr_struct {
  int busy; //whether in use or not
  void *ptr;
  void *stack;
};


struct ptr_struct ptrs[64];

char *
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while ((*s++ = *t++) != 0)
    ;
  return os;
}

int strcmp(const char *p, const char *q)
{
  while (*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint strlen(const char *s)
{
  int n;

  for (n = 0; s[n]; n++)
    ;
  return n;
}

void *
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char *
strchr(const char *s, char c)
{
  for (; *s; s++)
    if (*s == c)
      return (char *)s;
  return 0;
}

char *
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for (i = 0; i + 1 < max;)
  {
    cc = read(0, &c, 1);
    if (cc < 1)
      break;
    buf[i++] = c;
    if (c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if (fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int atoi(const char *s)
{
  int n;

  n = 0;
  while ('0' <= *s && *s <= '9')
    n = n * 10 + *s++ - '0';
  return n;
}

void *
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while (n-- > 0)
    *dst++ = *src++;
  return vdst;
}

// new
void new_lock(my_lock *l)
{
  ;
}

void lock(my_lock *l)
{
  ;
}

void unlock(my_lock *l)
{
  ;
}

int thread_create(void (*fn)(void *), void *arg)
{
  void *thread_stack_pointer = malloc(PGSIZE * 2);

  if (thread_stack_pointer == 0)
    return -1;

  // Check allocated stack is complete
  if ((uint)thread_stack_pointer % PGSIZE) // if not complete then add more
    thread_stack_pointer = thread_stack_pointer + (PGSIZE - ((uint)thread_stack_pointer % PGSIZE));

  int thread_id = clone(fn, arg, thread_stack_pointer);
  return thread_id;
}

int thread_join() 
{
  void* stack;
  int ret = join(&stack);
  // Checking if all the children are zombie
  for(int i = 0; i < 64; i++){
    if(ptrs[i].busy == 1 && ptrs[i].stack == stack){
      free(ptrs[i].ptr);
      ptrs[i].stack = NULL;
      ptrs[i].busy = 0;
      ptrs[i].ptr = NULL;
      break;
    }
  }
  return ret;
}
