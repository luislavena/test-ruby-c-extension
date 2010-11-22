#include <ruby.h>

void Init_testext(void)
{
    rb_p(ID2SYM(rb_intern("ok")));
}
