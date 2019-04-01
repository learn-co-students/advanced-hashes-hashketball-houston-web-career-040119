# Write your code here!

require "pry"

def game_hash
  game={
    
  home:{
    team_name:"Brooklyn Nets",
    colors:["Black", "White"],
    players:{
      "Alan Anderson"=>{
        number:0,
        shoe:16,
        points:22,
        rebounds:12,
        assists:12,
        steals:3,
        blocks:1,
        slam_dunks:1
      },
      "Reggie Evans"=>{
        number:30,
        shoe:14,
        points:12,
        rebounds:12,
        assists:12,
        steals:12,
        blocks:12,
        slam_dunks:7
      },
        "Brook Lopez"=>{
        number:11,
        shoe:17,
        points:17,
        rebounds:19,
        assists:10,
        steals:3,
        blocks:1,
        slam_dunks:15
      },
        "Mason Plumlee"=>{
        number:1,
        shoe:19,
        points:26,
        rebounds:12,
        assists:6,
        steals:3,
        blocks:8,
        slam_dunks:5
      },
        "Jason Terry"=>{
        number:31,
        shoe:15,
        points:19,
        rebounds:2,
        assists:2,
        steals:4,
        blocks:11,
        slam_dunks:1
      }
    }
  },
  
  away:{
    team_name:"Charlotte Hornets",
    colors:["Turquoise","Purple"],
    players:{
      "Jeff Adrien"=>{
        number:4,
        shoe:18,
        points:10,
        rebounds:1,
        assists:1,
        steals:2,
        blocks:7,
        slam_dunks:2
      },
      "Bismak Biyombo"=>{
        number:0,
        shoe:16,
        points:12,
        rebounds:4,
        assists:7,
        steals:7,
        blocks:15,
        slam_dunks:10
      },
        "DeSagna Diop"=>{
        number:2,
        shoe:14,
        points:24,
        rebounds:12,
        assists:12,
        steals:4,
        blocks:5,
        slam_dunks:5
      },
        "Ben Gordon"=>{
        number:8,
        shoe:15,
        points:33,
        rebounds:3,
        assists:2,
        steals:1,
        blocks:1,
        slam_dunks:0
      },
        "Brendan Haywood"=>{
        number:33,
        shoe:15,
        points:6,
        rebounds:12,
        assists:12,
        steals:22,
        blocks:5,
        slam_dunks:12
    }
  }
  }
  }
end



def num_points_scored(player_name)
  game_hash.each do |location, team_info|
    team_info.each do |attribute, info|
      if info.include?(player_name)
        return game_hash[location][attribute][player_name][:points]
      end
    end
  end
end

def shoe_size(player)
  
  shoe=0
  game_hash.each do |location, team_info|
    team_info.each do |attribute, info|
      if info.include?(player)
         return game_hash[location][attribute][player][:shoe]
      end
    end
  end

end

def team_colors(team_name)
  game_hash.each do |location, team_info|
    team_info.each do |attribute, data|
      if data == team_name
        return game_hash[location][:colors]
      end
    end
  end
end

def team_names
  
  teams=[]
  
  game_hash.each do |location, team_info|
    team_info.each do |attribute, info|
      if attribute == :team_name
        teams.push(info)
      end
    end
  end
  teams
end

def player_numbers(team_name)
  jerseys=[]
  
  game_hash.each do |location, team_info|
    team_info.each do |attribute,info|
     if info == team_name
       game_hash[location][:players].each do |name, values|
          values.each do |x,y|
            if x == :number
              jerseys.push(y)
            end
          end
       end
     end
    end
  end
  jerseys
end
  
def player_stats(player_name)
  
  player_hash={}
  
  game_hash.each do |location, team_info|
    team_info.each do |attributes, data|
      if attributes==:players
        data.each do |x,y|
          if x==player_name
            y.each do |a,b|
              player_hash[a]=b
            end
          end
        end
      end
    end
  end
  player_hash
end

def big_shoe_rebounds
  
  player_shoes={}
  player_rebounds={}
  
  game_hash.each do |location, team_info|
    team_info.each do |attributes, data|
      if attributes == :players
        data.each do |x,y|
          y.each do |a,b|
            if a == :shoe
              player_shoes[x]=b
            elsif a == :rebounds
              player_rebounds[x]=b
            end
          end
        end
      end
    end
  end

biggest=player_shoes.sort_by {|x,y| y}[-1][0]

player_rebounds[biggest]

end




