*** settings ***

Library  RequestsLibrary
Library  Collections

*** variables ***

${base_url}    http://localhost:8080/
${operation1}   taxRelief
${operation2}   taxReliefSummary
${operation3}   insert
${operation4}   insertMultiple
${operation5}   insertRandomToDatabaseForNoReason
${operation6}   dispense
${headers}  Create Dictionary  Content-Type=application/json

*** Test Cases ***

Verify_base_url
    ${response0} =  GET  ${base_url}
    log to console  ${response0.status_code}
    log to console  ${response0.content}
    log to console  ${response0.headers}
    #validation
    ${status_code}   convert to string  ${response0.status_code}
    Should Be Equal As Strings    ${status_code}    200

    ${resp}    convert to string  ${response0.content}
    Should Contain    ${resp}  The Oppenheimer


rack_entries_to_database
    Create Session    session1    ${base_url}/${operation5}
    ${params}  Create Dictionary  count=10
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response5} =  Post Request  session1  ${base_url}/calculator/${operation5}   params=${params}    headers=${headers}

    log to console  ${response5.status_code}
    log to console  ${response5.content}
    log to console  ${response5.headers}

    #validation
    ${status_code}   convert to string  ${response5.status_code}
    Should Be Equal As Strings    ${status_code}    200

    ${resp}    convert to string  ${response5.content}
    Should Contain    ${resp}    Successfully inserted


Get_tax_relief_info # test case name

    #sending GET request for fetching tax relief
    ${response1} =  GET  ${base_url}/calculator/${operation1}

    #printing logs in console for debugging
    log to console  ${response1.status_code}
    log to console  ${response1.content}
    log to console  ${response1.headers}

    #validations of result
    ${status_code}   convert to string  ${response1.status_code}
    Should Be Equal As Strings    ${status_code}    200

    ${resp}    convert to string  ${response1.content}
    Should Contain    ${resp}    natid
    Should Contain    ${resp}    relief


Get_tax_relief_summary_info

    ${response2} =  GET  ${base_url}/calculator/${operation2}
    log to console  ${response2.status_code}
    log to console  ${response2.content}
    log to console  ${response2.headers}


    #validation
    ${status_code}   convert to string  ${response2.status_code}
    Should Be Equal As Strings    ${status_code}    200

    ${resp}    convert to string  ${response2.content}
    Should Contain    ${resp}    totalWorkingClassHeroes
    Should Contain    ${resp}    totalTaxReliefAmount

Post_insert_one_entry
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=11091934  gender=M  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response3} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response3.status_code}
    log to console  ${response3.content}
    log to console  ${response3.headers}

    #validation
    ${status_code}   convert to string  ${response3.status_code}
    Should Be Equal As Strings    ${status_code}    202

    ${resp}    convert to string  ${response3.content}
    Should Contain    ${resp}    Alright


Verify_cash_dispensed_function
    ${response6} =  GET  ${base_url}/${operation6}
    log to console  ${response6.status_code}
    log to console  ${response6.content}
    log to console  ${response6.headers}

    #validation
    ${status_code}   convert to string  ${response6.status_code}
    Should Be Equal As Strings    ${status_code}    200

    ${resp}    convert to string  ${response6.content}
    Should Contain    ${resp}    Cash dispensed






