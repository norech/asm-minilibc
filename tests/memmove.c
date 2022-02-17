#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./libasm.so", RTLD_LAZY);
    char *(*my_memmove)(char *, const char *, int) = dlsym(dl, "memmove");
    char s1[100] = {0};
    char s2[100] = {0};

    my_memmove(s1, "hello", 6);
    memmove(s2, "hello", 6);
    assert(strncmp(s1, s2, 6) == 0);

    my_memmove(s1, "azertyuiop", 3);
    memmove(s2, "azertyuiop", 3);
    assert(strncmp(s1, s2, 4) == 0);

    my_memmove(s1 + 1, s1 + 2, 3);
    memmove(s2 + 1, s2 + 2, 3);
    assert(strncmp(s1, s2, 4) == 0);

    printf("'%s' == '%s'\n", s1, s2);

    printf("memmove: OK\n");
    dlclose(dl);
}
