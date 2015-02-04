Host cacti

* sudo apt-get install cacti
* sudo apt-get install cacti-spine

Configure http://localhost/cacti

Agent
 * Install snmpd, snmp, snmp-mibs-downloader

sudo apt-get install snmpd snmp snmp-mibs-downloader

- Configure /etc/default/snmpd

    # This file controls the activity of snmpd and snmptrapd

    # Don't load any MIBs by default.
    # You might comment this lines once you have the MIBs downloaded.
    export MIBS=UCD-SNMP-MIB

    # snmpd control (yes means start daemon).
    SNMPDRUN=yes

    # snmpd options (use syslog, close stdin/out/err).
    SNMPDOPTS='-LS4d -Lf /dev/null -u snmp -g snmp -I -smux -p /var/run/snmpd.pid'

    # snmptrapd control (yes means start daemon).  As of net-snmp version
    # 5.0, master agentx support must be enabled in snmpd before snmptrapd
    # can be run.  See snmpd.conf(5) for how to do this.
    TRAPDRUN=no

    # snmptrapd options (use syslog).
    TRAPDOPTS='-Lsd -p /var/run/snmptrapd.pid'

    # create symlink on Debian legacy location to official RFC path
    SNMPDCOMPAT=yes

- Configure /etc/snmp/snmpd.conf

    agentAddress udp:161,udp6:[::1]:161

    createUser internalUser MD5 "mypassword3"
    createUser cacti SHA "mypassword4" AES "passphrase4"

    view   systemonly  included   .1.3.6.1.2.1.1
    view   systemonly  included   .1.3.6.1.2.1.25.1

    rouser cacti

    #rocommunity public  localhost
    #rocommunity public  default    -V systemonly
    #rocommunity secret  10.0.0.0/16
    #rouser   authOnlyUser
    #rwuser   authPrivUser   priv

    sysLocation    IndexerAntaraAB-1
    sysContact     Pablo Palazon <ppalazon@antara.ws>
    sysServices    72

    iquerySecName   internalUser
    rouser          internalUser

    defaultMonitors          yes
    linkUpDownNotifications  yes

    master          agentx

- Log de snmpd /var/log/syslog

- Reference:
http://blog.tersmitten.nl/how-to-get-snmpv3-working-in-ubuntu-12-04.html
