from configparser import ConfigParser
import sys, getopt



def readconfig(elasticHost, esindex, localServer, localPort, mongoport, mongohost,debug, slacktoken, slackuse):
    config = ConfigParser()

    candidates = ['/etc/ews/ewsput.cfg']

    config.read(candidates)

    elasticHost = config.get("elasticsearch", "ip")
    esindex = config.get("elasticsearch", "index")

    localServer = config.get('home', 'ip')
    localPort = config.get('home', 'port')

    mongohost = config.get('mongo', 'ip')
    mongoport = config.get('mongo', 'port')

    slacktoken = config.get('slack', "token")
    slackuse = config.get('slack', "use")

    debugCmd = config.get('general', 'debug')
    if (debugCmd == "1"):
        debug = True
    else:
        debug = False

    return (elasticHost, esindex, localServer, localPort, mongoport, mongohost, False, debug, slacktoken, slackuse)


def readCommandLine(elasticHost, esindex, localServer, localPort, mongoport, mongohost, createIndex, debug, testSettings):

    #
    # Read command line args
    #
    myopts, args = getopt.getopt(sys.argv[1:], "b:u:i:p:h:l:cdt")
    debugCmd = "0"

    for o, a in myopts:

        if o == '-u':
            elasticHost = a
        elif o == '-i':
            esindex = a
        elif o == '-p':
            localPort = a
        elif o == '-b':
            localServer = a
        elif o == '-h':
            mongohost = a
        elif o == '-l':
            mongoport = a
        elif o == '-d':
            debugCmd = a
        elif o == '-c':
            createIndex = True
        elif o == '-t':
            testSettings = True

    if (debugCmd == "1"):
        debug = True
    else:
        debug = False

    return (elasticHost, esindex, localServer, localPort, mongoport, mongohost, createIndex, debug, testSettings)
