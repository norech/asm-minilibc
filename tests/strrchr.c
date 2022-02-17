#include <dlfcn.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

int main()
{
    void *dl = dlopen("./libasm.so", RTLD_LAZY);
    const char *(*my_strrchr)(const char *, int) = dlsym(dl, "strrchr");
    const char *s;

    s = "Hello";
    assert(my_strrchr(s, 'e') == strrchr(s, 'e'));

    s = "Hi";
    assert(my_strrchr(s, 'e') == strrchr(s, 'e'));

    s = "";
    assert(my_strrchr(s, 'e') == strrchr(s, 'e'));

    s = "In the observable universe, there are billion stars";
    assert(my_strrchr(s, 'o') == strrchr(s, 'o'));
    printf("strrchr: OK\n");
    dlclose(dl);
}
