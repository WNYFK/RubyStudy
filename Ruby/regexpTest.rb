str = " @interface CBTestClass: NSObject"
re = %r|^\s*@interface\s*(([^\s]|[^:])*)|

re =~ str
print $1, "\n"
p $2
p $3
