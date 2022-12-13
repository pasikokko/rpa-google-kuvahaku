*** Settings ***
Library     RPA.Browser.Selenium

Resource    imageSearch.robot

*** Tasks ***
Get Related Images
    [Setup]    Open Available Browser
    FOR    ${id}    IN RANGE    100    110
        Get Images For a Person    Person ${id}    https://i.pravatar.cc/400?u=${id}
    END
