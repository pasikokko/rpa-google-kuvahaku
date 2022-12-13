*** Settings ***
Library     RPA.Browser.Selenium


*** Keywords ***
Get Images For a Person
    [Arguments]    ${name}    ${img_url}
    Go To    https://www.google.fi
    Accept Cookies If Visible
    Wait Until Element Is Visible    alias:CameraSearch
    Sleep    300ms
    Click Element    alias:CameraSearch
    Wait Until Element Is Visible    alias:ImageLinkInput
    Click Element    alias:ImageLinkInput
    Input Text    alias:ImageLinkInput    ${img_url}
    Press Keys    alias:ImageLinkInput    RETURN
    Accept Cookies If Visible
    ${link_href}=    Get Element Attribute    alias:Find Image Source    href
    Go To    ${link_href}
    Take Screenshot of Similar Images    ${OUTPUT_DIR}${/}${name} images.png

Accept Cookies If Visible
    TRY
        Wait Until Element Is Visible    alias:CookiesAcceptAll    500ms
        Click Element    alias:CookiesAcceptAll
    EXCEPT    AS    ${msg}
        Log    ${msg}
    END

Take Screenshot of Similar Images
    [Arguments]    ${filename}
    TRY
        Wait Until Element Is Visible    alias:VisuallySimilarImages    1s
        Capture Element Screenshot    alias:Images    ${filename}
    EXCEPT
        Log    Similar images not found    WARN
    END
