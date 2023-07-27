#include "types.h"
#include "stat.h"
#include "user.h"

struct add
{
  int a0;
  int b0;
};

void test1(void *a)
{
  struct add *inp = a;
  // sleep(800);
  inp->b0 = 565;
  // printf(1, "\ntest1 ...    a = %d, b = %d\n", inp->a0, (int)inp->b0);
  // printf(1, "thread 1 pid = %d\n", getpid());
  sleep(300);
  // printf(1, "\nexit thread 1 pid = %d\n", getpid());
  exit();
}

void test2(void *a)
{
  // sleep(400);
  struct add *inp = a;
  inp->a0 = 55;
  // printf(1, "\ntest2 ...    a = %d, b = %d\n", inp->a0, (int)inp->b0);
  // printf(1, "thread 2 pid = %d\n", getpid());
  // sleep(1700);
  // printf(1, "\nexit thread 2 pid = %d\n", getpid());
  exit();
}

int main()
{
  struct add var1; var1.a0 = 11; var1.b0 = 1111;
  // struct add var2; var2.a0 = 22; var2.b0 = 2222;

  int t_id_1 = thread_create(&test1, (void *)&var1);
  int t_id_2 = thread_create(&test2, (void *)&var1);

  sleep(100);
  printf(1, "wait for child 1 id = %d\n", t_id_1);
  printf(1, "wait for child 2 id = %d\n", t_id_2);

  thread_join();
  thread_join();


  printf(1, "\na=%d", var1.a0);
  printf(1, "\nb=%d", var1.b0);

  printf(1, "\nfinish all.\n");


  exit();
}
