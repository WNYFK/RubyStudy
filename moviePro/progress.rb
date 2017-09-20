module MYP
  class Progress
    def self.loading(curIndex, totalIndex)
      print "#{(curIndex.to_f/totalIndex.to_f*100).to_i}%"
      print "\b\b\b\b\b\b\b"
    end
  end
end
