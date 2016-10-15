from unifi.controller import Controller
c = Controller('10.1.1.134:8443', 'Ainsey11', 'Ainsey11:)')
for ap in c.get_aps():
    print 'AP named %s with MAC %s' % (ap.get('name'), ap['mac'])
