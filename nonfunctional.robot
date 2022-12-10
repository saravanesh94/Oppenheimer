*** Settings ***

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

Post_insert_one_entry_wrong_date
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=35091934  gender=M  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error

Post_insert_one_entry_wrong_date_within_range
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31111934  gender=M  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error

Post_insert_one_entry_wrong_gender
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31111934  gender=S  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error


Post_insert_one_entry_wrong_month
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31151934  gender=S  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error

Post_insert_one_entry_wrong_year
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=311119345  gender=S  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error

Post_insert_one_entry_wrong_year
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=311119345  gender=S  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error


Post_insert_one_entry_wrong_year_with_in_range
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31112934  gender=S  name=mbappe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error


Post_insert_one_entry_wrong_salary
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31111934  gender=M  name=mbappe  natid=71224444  salary=78ss94  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error


Post_insert_one_entry_wrong_tax
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31111934  gender=M  name=mbappe  natid=71224444  salary=7894  tax=1ss24
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error

Post_insert_one_entry_name
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31111934  gender=M  name=mb&*appe  natid=71224444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error

Post_insert_one_entry_with_wrong_natid
    Create Session    session1    ${base_url}/${operation3}
    ${body}   Create Dictionary  birthday=31111934  gender=M  name=mbappe  natid=7122&^4444  salary=7894  tax=124
    ${headers}  Create Dictionary  Content-Type=application/json
    ${response} =  Post Request  session1  ${base_url}/calculator/${operation3}  data=${body}  headers=${headers}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console  ${response.headers}

    #validation
    ${status_code}   convert to string  ${response.status_code}
    Should Be Equal As Strings    ${status_code}    500

    ${resp}    convert to string  ${response.content}
    Should Contain    ${resp}   Internal Server Error
