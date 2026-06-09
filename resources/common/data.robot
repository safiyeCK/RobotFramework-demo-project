*** Keywords ***
Generate Unique Email
    ${email_suffix}=    Evaluate    __import__("uuid").uuid4().hex[:8]
    RETURN    demo_${email_suffix}@example.com

Generate Strong Password
    ${password_suffix}=    Evaluate    __import__("uuid").uuid4().hex[:12]
    RETURN    Aa1@${password_suffix}
