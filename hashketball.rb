# Write your code here!
require 'pry' 

def game_hash
  the_big_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
         "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end 

#points per player 

def num_points_scored(player_input)
  player_points = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
        if c == player_input
          player_points = d[:points]
        end
    end
  end
  player_points
end

#shoe_size of each player 

def shoe_size(player_input)
  sweet_kicks = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
        if c == player_input
          sweet_kicks = d[:shoe]
        end
    end
  end
  sweet_kicks
end

#Team colors 

def team_colors(teamname)
  tc = []
  game_hash.each do |a,b|
    if b[:team_name] == teamname 
      tc = b[:colors]
    end
  end
  tc
end 

#Returns the team names

def team_names
  versus = []
  game_hash.each do |a,b|
    versus << b[:team_name]
  end
  versus
end 

#Returns the team numbers 

def player_numbers(team)
  jerseys = []
  game_hash.each do |a,b|
    if team == b[:team_name]
      b[:players].each do |c,d|
        jerseys << d[:number]
      end
    end
  end
  jerseys.sort 
end 

#returns all stats for a given player

def player_stats(athlete)
  athlete_stats = {}
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if c == athlete
        athlete_stats = d
      end
    end
  end
  athlete_stats
end 

#Returns the number of rebounds of the player with the biggest shoe size

def big_shoe_rebounds
  big_shoe_rbnds = 0
  big_shoe = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if d[:shoe] > big_shoe
        big_shoe_rbnds = d[:rebounds]
      end
    end
  end
  big_shoe_rbnds
end 

#Returns the player who returns most points scored 

def most_points_scored
  most_points_person = ""
  most_points = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if d[:points] > most_points
        most_points = d[:points]
        most_points_person = c
      end
    end
  end
  most_points_person
end 

#Returns the winning team 

def winning_team
  points_home = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if a.to_s == "home"
        points_home = d[:points] + points_home
      end
    end
  end 
  points_away = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if a.to_s == "away"
        points_away = d[:points] + points_away
      end
    end
  end 
  points_home > points_away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end 

#Return the player with the longest name

def player_with_longest_name  
  most_letters_person = ""
  most_letters = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if c.length > most_letters
        most_letters_person = c
      end
    end
  end
  most_letters_person
end 

#super bonus: does the person with the longest name steal the most?

def long_name_steals_a_ton?
  most_letters_person = ""
  most_letters = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if c.length > most_letters
        most_letters_person = c
      end
    end
  end
  most_steals_person = ""
  most_steals = 0
  game_hash.each do |a,b|
    b[:players].each do |c,d|
      if d[:steals] > most_steals
        most_steals_person = c
      end
    end
  end
  most_steals_person
  most_steals_person == most_letters_person ? true : false
end