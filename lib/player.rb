class Player < ActiveRecord::Base
    has_many :teams
    has_many :battles

    def wins
        Battle.player_battles_won_team_ids.select { |team_id| team_ids.include?(team_id) }
    end

    def self.players_with_teams
        self.all.select { |player| player.teams.count > 0 }
    end

    def self.player_ids_with_teams
        players_with_teams.map { |player| player.id }
    end

    def self.team_ids
        teams.map { |team| team.id } 
    end

    def self.names
        self.pluck(:names)
    end

    def self.players_with_teams
        self.all.select { |player| player.teams.count > 0 }        
    end
end

