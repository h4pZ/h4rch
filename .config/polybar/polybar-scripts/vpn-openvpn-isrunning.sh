
#!/bin/sh

if [ "$(pgrep openvpn)" ]; then
   country=$(pvpn --ip | xargs geoiplookup | cut -d ' ' -f 4 | tr -d ',')
   echo "VPN - $country"
else
    echo ""
fi
