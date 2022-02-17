#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./minilibc.so", RTLD_LAZY);
    const char *(*my_memset)(const char *, int, int) = dlsym(dl, "memset");
    char s1[100] = {0};
    char s2[100] = {0};

    my_memset(s1, 'a', 10);
    memset(s2, 'a', 10);
    assert(strncmp(s1, s2, 11));

    my_memset(s1, 'a', 15);
    memset(s2, 'a', 15);
    assert(strncmp(s1, s2, 16));

    printf("memset: OK\n");
    dlclose(dl);
}
