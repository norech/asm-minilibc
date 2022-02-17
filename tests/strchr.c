#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./minilibc.so", RTLD_LAZY);
    const char *(*my_strchr)(const char *, int) = dlsym(dl, "strchr");
    const char *s;

    s = "Hello";
    assert(my_strchr(s, 'e') == strchr(s, 'e'));

    s = "Hi";
    assert(my_strchr(s, 'e') == strchr(s, 'e'));

    s = "";
    assert(my_strchr(s, 'e') == strchr(s, 'e'));

    s = "In the observable universe, there are billion stars";
    assert(my_strchr(s, 'o') == strchr(s, 'o'));
    printf("strchr: OK\n");
    dlclose(dl);
}
