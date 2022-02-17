#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./minilibc.so", RTLD_LAZY);
    int (*my_strcmp)(const char *, const char *) = dlsym(dl, "strcmp");
    const char *s1;
    const char *s2;

    s1 = "Hello";
    s2 = "Hello";
    assert(my_strcmp(s1, s2) == strcmp(s1, s2));

    s1 = "Hi";
    s2 = "hello";
    assert(my_strcmp(s1, s2) == strcmp(s1, s2));

    s1 = "";
    s2 = "";
    assert(my_strcmp(s1, s2) == strcmp(s1, s2));

    s1 = "In the observable universe, there are billion stars";
    s2 = "IN";
    assert(my_strcmp(s1, s2) == strcmp(s1, s2));

    printf("strcmp: OK\n");
    dlclose(dl);
}
