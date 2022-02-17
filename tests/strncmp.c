#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./libasm.so", RTLD_LAZY);
    int (*my_strncmp)(const char *, const char *, int) = dlsym(dl, "strncmp");
    const char *s1;
    const char *s2;

    s1 = "Hello";
    s2 = "Hello";
    assert(my_strncmp(s1, s2, 5) == strncmp(s1, s2, 5));

    s1 = "Hi";
    s2 = "hello";
    assert(my_strncmp(s1, s2, 3) == strncmp(s1, s2, 3));

    s1 = "";
    s2 = "";
    assert(my_strncmp(s1, s2, 0) == strncmp(s1, s2, 0));

    s1 = "In the observable universe, there are billion stars";
    s2 = "IN";
    assert(my_strncmp(s1, s2, 1) == strncmp(s1, s2, 1));

    printf("strncmp: OK\n");
    dlclose(dl);
}
