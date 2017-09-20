require './moviePro'
MYP::find(ARGV[0] || "Swift", ARGV[1])

# classRegrexp = /\=?\s*MYPAdvertViewController\s*[.(?!,{]/
# str = "        advertViewController = MYPAdvertViewController(cityId: 1, standId: MYPAdvertStand.boxOffice.rawValue)"
# p File.open("/Users/admin/moviepro/moviePro/ViewController/BoxOffice/MYPBoxOfficeAnalyseListViewController.swift").read
# if File.open("/Users/admin/moviepro/moviePro/ViewController/BoxOffice/MYPBoxOfficeAnalyseListViewController.swift").read().match?(classRegrexp)
# p "aa"
# end
# classRegrexp = /^[^(\s*\/*)]*\s*[a-zA-Z0-9_]*\s*MYPSearchBar\s*[.\(?!,{]?/


# classRegrexp = /\s*[a-zA-Z0-9_]*\s*MYPSearchBar\s*[.\(?!,{]?/
# str = "var searchBar = MYPSearchBar()"
# if str.match?(classRegrexp)
# p "aaa"
# end
# classRegrexp = /^[^(\s*\/\/)][\s\S]*?[^(class)]\s*MYPPsersonalProductItem/
# classRegrexp = /[\s\S]*?[^(class)]\s*MYPPsersonalProductItem/
#
# content = "// MYPCinemaPortraitChartBarView"
# content = " //  MYPPsersonalProductItem.swift"
# classRegrexp = /([\(\[{=:]|as\?|as!|is|return|,)\s*#{swift.name}[^\w]/

# classRegrexp = /MAYScrollableLabelSegmentControl\s*[^(.h|.m|:|\(][^\w]/
# reg2 = /@interface\s*MAYScrollableLabelSegmentControl\s*/
# content = File.open("/Users/admin/moviepro/moviePro/MYPUIKit/MAYScrollableSegmentControl.h").read
# p content
# if content.match?(classRegrexp) && !content.match?(reg2)
# p "aaa"
# end
