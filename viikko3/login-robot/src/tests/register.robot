*** Settings ***
Resource  resource.robot
Test Setup  Input New Command

*** Test Cases ***

Register With Valid Username And Password
    Input Credentials  kalle  kalle1aaaaa
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Create User  kalle  kolliaaaaa
    Input Credentials  kalle  kalle123aaaa
    Output Should Contain  User with username kalle already exists

Register With Too Short Username And Password
    Input Credentials  k  kalle3aaaaaa
    Output Should Contain  Username k is too short

Register With Valid Username And Too Short Password
    Input Credentials  kallelll  k
    Output Should Contain  Password k is too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  kolle  villeaaaaa
    Output Should Contain  New user registered

*** Keywords ***
