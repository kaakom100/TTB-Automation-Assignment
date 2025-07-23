*** Settings ***
Library    SeleniumLibrary
Library    AppiumLibrary
Library    RequestsLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    BuiltIn

# Config Web
Variables         ${EXECDIR}/Configuration/Web/Configs_Timeout.yml
Variables         ${EXECDIR}/Configuration/Web/Configs_Run_Test_Global.yml
Variables         ${EXECDIR}/Resource/Web/KeyRepositories.yml

# Config Mobile
Variables         ${EXECDIR}/Configuration/Mobile/Configs_Timeout.yml
