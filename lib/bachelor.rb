def get_first_name_of_season_winner(data, season)
  data[season].each {|contestant_val|
    return contestant_val["status"] == "Winner" ? contestant_val["name"].split.shift : nil
  }
end

def get_contestant_name(data, occupation)
  data.map {|season, contestants|
    contestants.map {|contestant_hash|
      return contestant_hash["name"] if contestant_hash["occupation"] == occupation
    }
  }
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.map {|season, contestants|
    contestants.map {|contestant|
      count += 1 if contestant["hometown"]== hometown
    }
  }
  count
end

def get_occupation(data, hometown)
  data.map {|season, contestants|
    contestants.map {|contestant|
      return contestant["occupation"] if contestant["hometown"] === hometown
    }
  }
end

def get_average_age_for_season(data, season)
  ages = Array.new()
  data[season].each { |contestant| ages << contestant["age"].to_i }
  return (ages.reduce(:+).to_f / ages.length.to_f).round # http://apidock.com/ruby/Enumerable/reduce
end
