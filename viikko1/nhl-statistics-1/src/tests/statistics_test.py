import unittest
from statistics import Statistics
from player import Player

class PlayerReaderStub:
    def get_players(self):
        return [
            Player("Semenko", "EDM", 4, 12),
            Player("Lemieux", "PIT", 45, 54),
            Player("Kurri",   "EDM", 37, 53),
            Player("Yzerman", "DET", 42, 56),
            Player("Gretzky", "EDM", 35, 89)
        ]

class TestStatistics(unittest.TestCase):
    def setUp(self):
        self.statistics = Statistics(PlayerReaderStub())
    
    def test_etsitaan_nimi_on_olemassa(self):
        self.assertTrue(type(self.statistics.search("Gretzky")) is Player)

    def test_etsitaan_nimi_ei_olemassa(self):
        self.assertTrue(self.statistics.search("Gratzky") is None)

    def test_team_palauttaa_listan(self):
        self.assertTrue(type(self.statistics.team("EDM")) is list)

    def test_top_scorer_is_Gretzky(self):
        
        self.assertTrue(self.statistics.top_scorers(1)[0].points == (35+89))

    
