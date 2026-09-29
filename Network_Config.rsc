# sep/29/2026 18:40:33 by RouterOS 7.7
# software id = 
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no
set [ find default-name=ether2 ] disable-running-check=no
set [ find default-name=ether3 ] disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
set [ find default-name=ether5 ] disable-running-check=no
set [ find default-name=ether6 ] disable-running-check=no
set [ find default-name=ether7 ] disable-running-check=no
set [ find default-name=ether8 ] disable-running-check=no
set [ find default-name=ether9 ] disable-running-check=no
set [ find default-name=ether10 ] disable-running-check=no
set [ find default-name=ether11 ] disable-running-check=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot profile
set [ find default=yes ] login-by=http-chap
/ip hotspot user profile
add name=speed_normal rate-limit=2M/2M
add name=speed_gaming rate-limit=4M/4M
/port
set 0 name=serial0
/ip address
add address=172.20.100.1/24 interface=ether2 network=172.20.100.0
/ip dhcp-client
add interface=ether1
/ip dhcp-server
add address-pool=hs-pool-11 interface=ether2 lease-time=30m name=dhcp1
/ip dhcp-server network
add address=172.20.1.0/24 dns-server=8.8.8.8,1.1.1.1 gateway=172.20.1.1
add address=192.168.163.0/24 gateway=192.168.163.130
/ip firewall filter
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat out-interface=ether1
add action=masquerade chain=srcnat comment="Internet Access" out-interface=\
    ether1
add action=masquerade chain=srcnat comment="Internet Access" out-interface=\
    ether1
add action=masquerade chain=srcnat out-interface=ether1
/ip hotspot
add address-pool=hs-pool-11 disabled=no interface=ether2 name=hs-ether2
/ip pool
add name=hs-pool-11 next-pool=hs-pool-11 ranges=172.20.2.2-172.20.2.254
/ip route
add dst-address=0.0.0.0/0 gateway=192.168.163.254
