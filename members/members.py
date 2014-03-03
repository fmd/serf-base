import json
from serfclient import connection
from serfclient.client import SerfClient

client = SerfClient()
con = connection.SerfConnection()
con.handshake()
result = con.call('members')

def get_members():
    return result.body.get('Members')
