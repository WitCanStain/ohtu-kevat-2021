from entities.user import User
import re
import sys, pdb

class UserInputError(Exception):
    pass


class AuthenticationError(Exception):
    pass


class UserService:
    def __init__(self, user_repository):
        self._user_repository = user_repository

    def check_credentials(self, username, password):
        if not username or not password:
            raise UserInputError("Username and password are required")

        user = self._user_repository.find_by_username(username)

        if not user or user.password != password:
            raise AuthenticationError("Invalid username or password")

        return user

    def create_user(self, username, password):
        self.validate(username, password)

        user = self._user_repository.create(
            User(username, password)
        )

        return user

    def validate(self, username, password):


        
        if not username or not password:
            raise UserInputError("Username and password are required")


        if len(username) < 3:
            raise Exception(
                f"Username {username} is too short"
            )

        if len(password) < 8:
            raise Exception(
                f"Password {password} is too short"
            )
        
        pattern = re.compile("^[a-z]+$")


        if pattern.search(username) is None:
            raise Exception(
                f"Username {username} is not composed of alphabetic characters"
            )
        # toteuta loput tarkastukset tänne ja nosta virhe virhetilanteissa
