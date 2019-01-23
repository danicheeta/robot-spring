*** Settings ***
Resource	../resource/settings.robot
Resource	../resource/add.robot
Variables	../variables/vars.yaml


*** Test Cases ***
TestAddingCity
    [Documentation]    adding new city
    ${cityref}=  Add new city  ${city_name}  ${city_state}  ${city_country}  ${city_map}
    Add new hotel  ${hotel_name}  ${hotel_address}  ${hotel_zip}  ${cityref}
