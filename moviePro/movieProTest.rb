require './moviePro'
selectFile = ARGV[0] || "Swift"
if selectFile.downcase == "swift"
  MYP::Swift.find()
else
  MYP::ObjectiveC.find()
end
