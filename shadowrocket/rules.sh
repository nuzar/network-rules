cat > my-rules.txt <<EOF
#!name=rules module
#!desc=rules module
[Rule]
EOF

#curl 'https://cdn.jsdelivr.net/gh/Loyalsoldier/surge-rules@release/ruleset/direct.txt' -o direct.txt
#curl 'https://cdn.jsdelivr.net/gh/Loyalsoldier/surge-rules@release/ruleset/proxy.txt' -o proxy.txt
#curl 'https://cdn.jsdelivr.net/gh/Loyalsoldier/surge-rules@release/ruleset/apple.txt' -o apple-cn.txt
#curl 'https://cdn.jsdelivr.net/gh/Loyalsoldier/surge-rules@release/ruleset/private.txt' -o private.txt

sed 's/$/,DIRECT/g' direct.txt >> my-rules.txt
sed 's/$/,PROXY/g' proxy.txt >> my-rules.txt
sed 's/$/,DIRECT/g' apple-cn.txt >> my-rules.txt
sed 's/$/,DIRECT/g' private.txt >> my-rules.txt

cat >> my-rules.txt <<EOF
IP-CIDR,192.168.0.0/16,DIRECT
IP-CIDR,10.0.0.0/8,DIRECT
IP-CIDR,172.16.0.0/12,DIRECT
IP-CIDR,127.0.0.0/8,DIRECT
GEOIP,CN,DIRECT
FINAL,PROXY
EOF
