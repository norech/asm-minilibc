#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./libasm.so", RTLD_LAZY);
    int (*my_strcasecmp)(const char *, const char *) = dlsym(dl, "strcasecmp");
    const char *s1;
    const char *s2;

    s1 = "Hello";
    s2 = "Hello";
    assert(my_strcasecmp(s1, s2) == strcasecmp(s1, s2));

    s1 = "Hi";
    s2 = "hello";
    assert(my_strcasecmp(s1, s2) == strcasecmp(s1, s2));

    s1 = "";
    s2 = "";
    assert(my_strcasecmp(s1, s2) == strcasecmp(s1, s2));

    s1 = "In the observable universe, there are billion stars";
    s2 = "IN";
    assert(my_strcasecmp(s1, s2) == strcasecmp(s1, s2));

    printf("strcasecmp: OK\n");
    dlclose(dl);
}
