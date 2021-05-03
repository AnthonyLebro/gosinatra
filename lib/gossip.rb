require 'pry'
class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author  = author
    @content = content
  end

 def save
  CSV.open('./db/gossip.csv', 'ab') {|csv| csv << [author,content]}
 end

 def self.all
  all_gossips = []
  CSV.read("./db/gossip.csv").each {|csv_line| all_gossips << Gossip.new(csv_line[0], csv_line[1])}
  return all_gossips
end

def self.find(id)
  gossip = []
  CSV.read("./db/gossip.csv").each_with_index  do |csv_line,index|
    if id == index+1
      gossip << Gossip.new(csv_line[0], csv_line[1])
      break
    end
  end
  return gossip
end

end