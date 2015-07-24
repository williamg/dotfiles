#!/usr/bin/env python

import imaplib

emails = [#EMAILS]
passwords = [#PASSWORDS]

fullcount = 0

for x in range(0, len(emails)):

    email = emails[x]
    password  = passwords[x]

    obj = imaplib.IMAP4_SSL('imap.gmail.com', 993)
    obj.login(email + '@gmail.com', password) 
    obj.select()
    data=obj.search(None, 'UNSEEN')
    fullcount += len(data[1][0].split())

print(fullcount)
