classRegrexp = /[^(\s*\/\/)][\s\S]*?[^(@interface|@implementation)]\s*MTBindPhoneController[^(.h|.m)]\s*/

content = "//self.phoneNumberViewController = [[MTBindPhoneController alloc] init];"
if content.match?(classRegrexp)
p "aaa"
end
