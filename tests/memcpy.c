#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./minilibc.so", RTLD_LAZY);
    char *(*my_memcpy)(char *, const char *, int) = dlsym(dl, "memcpy");
    char s1[100] = {0};
    char s2[100] = {0};

    my_memcpy(s1, "hello", 6);
    memcpy(s2, "hello", 6);
    assert(strncmp(s1, s2, 6) == 0);

    my_memcpy(s1, "azertyuiop", 3);
    memcpy(s2, "azertyuiop", 3);
    assert(strncmp(s1, s2, 4) == 0);

    printf("'%s' == '%s'\n", s1, s2);

    printf("memcpy: OK\n");
    dlclose(dl);
}
