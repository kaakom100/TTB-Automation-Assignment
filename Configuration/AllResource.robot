*** Settings ***
Library    SeleniumLibrary
Library    AppiumLibrary
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    DateTime

# Configuration Files
Variables         ${EXECDIR}/Configuration/Configs_Run_Test_Global.yml
Variables         ${EXECDIR}/Configuration/Configs_Timeout.yml
Variables         ${EXECDIR}/Resource/KeyRepositories.yml  

