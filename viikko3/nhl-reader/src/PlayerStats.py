

class PlayerStats:

    def __init__(self, PlayerReader):
        self.players = PlayerReader.get_players()

    def top_scorers_by_nationality(self, nationality):
        self.players.sort(key=lambda p: p.points(), reverse=True)
        return self.players