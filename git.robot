*** Settings ***
Library  SeleniumLibrary
Library  SSHLibrary
Suite Setup        Open Connection and Log In
Suite Teardown     Close All Connections

*** Variables ***
${HOST}             192.168.20.131
${USERNAME}         root
${PASSWORD}         123456

*** Test Cases ***
Execute Command And Verify Output
    ${output}=         Execute Command    echo Hello SSHLibrary!
    Should Be Equal    ${output}          Hello SSHLibrary!
    Set Tags  Execute Command And Verify Output
Test Firewall Service
    ${output}=         Execute Command    systemctl status firewalld
    Should Contain     ${output}          Active: active
    Set Tags  Test Firewall Service
Test-IP
    ${output}=         Execute Command    ip addr
    Should Contain     ${output}          192.168.20.131
    Set Tags  Test-IP
*** Keywords ***
Open Connection and Log In
    Open Connection    ${HOST}
    Login              ${USERNAME}    ${PASSWORD}
