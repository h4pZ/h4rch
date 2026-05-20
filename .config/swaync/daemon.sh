#!/bin/bash
CACHE="$HOME/.cache/swaync"

update_pkg() {
    pac_count=$(checkupdates 2>/dev/null | wc -l)
    aur_count=$(yay -Qua 2>/dev/null | wc -l)
    total=$((pac_count + aur_count))
    if [ "$total" -eq 0 ]; then
        echo "󰣇  All packages up to date"
    else
        echo "󰣇  Updates: ${pac_count} pacman · ${aur_count} AUR"
    fi > "$CACHE/pkg.txt"
}

update_vpn() {
    if command -v mullvad &>/dev/null; then
        mullvad_raw=$(mullvad status 2>/dev/null)
        if echo "$mullvad_raw" | grep -qi "^Connected"; then
            location=$(echo "$mullvad_raw" | grep "Visible location:" \
                | sed 's/.*Visible location:[[:space:]]*//' \
                | sed 's/\. IPv[46]:.*//')
            echo "󰒃  Connected · ${location}"
        elif echo "$mullvad_raw" | grep -qi "^Connecting"; then
            echo "󰒃  Connecting..."
        else
            echo "󰐜  Disconnected"
        fi
    else
        echo "󰐜  Mullvad not found"
    fi > "$CACHE/vpn.txt"
}

update_nvda() {
    nvda_raw=$(curl -s --connect-timeout 3 --max-time 8 \
        "https://query1.finance.yahoo.com/v8/finance/chart/NVDA?interval=1d&range=1mo" \
        -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64)")

    if echo "$nvda_raw" | jq -e '.chart.result[0]' &>/dev/null; then
        current=$(echo "$nvda_raw" | jq -r '.chart.result[0].meta.regularMarketPrice')
        prev=$(echo "$nvda_raw"    | jq -r '.chart.result[0].meta.chartPreviousClose')

        header=$(awk -v c="$current" -v p="$prev" 'BEGIN {
            d = c - p; pct = d / p * 100
            if (d >= 0) printf "󰻠 NVDA  $%.2f   ▲ +%.2f%%", c, pct
            else        printf "󰻠 NVDA  $%.2f   ▼ %.2f%%",  c, pct
        }')

        sparkline=$(echo "$nvda_raw" | jq -r \
            '.chart.result[0].indicators.quote[0].close | map(select(. != null)) | .[]' | \
            awk 'BEGIN {
                b[1]="▁"; b[2]="▂"; b[3]="▃"; b[4]="▄"
                b[5]="▅"; b[6]="▆"; b[7]="▇"; b[8]="█"
            }
            { v[NR]=$1; if(NR==1||$1<lo) lo=$1; if(NR==1||$1>hi) hi=$1 }
            END {
                r = hi - lo
                for (i=1; i<=NR; i++) {
                    idx = (r==0) ? 4 : int((v[i]-lo)/r*7)+1
                    if (idx>8) idx=8; if (idx<1) idx=1
                    printf b[idx]
                }
                print ""
            }')

        echo "${header}"$'\n'"${sparkline}  1mo"
    else
        echo "󰻠 NVDA  unavailable"
    fi > "$CACHE/nvda.txt"
}

# --- Seed cache immediately on start ---
update_pkg  &
update_vpn  &
update_nvda &
wait

# --- Loop: update each source on its own schedule ---
pkg_tick=0
nvda_tick=0

while true; do
    sleep 30

    update_vpn &

    pkg_tick=$((pkg_tick + 30))
    if [ "$pkg_tick" -ge 1800 ]; then
        update_pkg &
        pkg_tick=0
    fi

    nvda_tick=$((nvda_tick + 30))
    if [ "$nvda_tick" -ge 600 ]; then
        update_nvda &
        nvda_tick=0
    fi
done
