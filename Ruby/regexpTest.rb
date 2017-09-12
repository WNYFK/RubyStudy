str = " @interface CBTestClass() : NSObject"
re = %r|^\s*@interface\s*(([^:])*)|

re =~ str
p $1.gsub(/\s+/, '').sub('(', '')
p $2
p $3
