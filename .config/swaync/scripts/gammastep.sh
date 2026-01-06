#!/bin/bash

# Настройки для Минска
LAT=53.9
LON=27.6
TEMP_LOW=3500   # Ночная температура
TEMP_HIGH=6500  # Дневная температура

# Логика переключения (toggle)
if [ "$1" = "toggle" ]; then
    if pgrep -x "wlsunset" > /dev/null; then
        pkill -x wlsunset
    else
        # wlsunset запускается немного иначе: -l широта -L долгота
        wlsunset -l $LAT -L $LON -t $TEMP_LOW -T $TEMP_HIGH > /dev/null 2>&1 &
        disown
    fi
    exit 0
fi

# Логика для Waybar
if pgrep -x "wlsunset" > /dev/null; then
    echo '{"text": "", "class": "on", "tooltip": "Ночной режим: ВКЛ"}'
else
    echo '{"text": "", "class": "off", "tooltip": "Ночной режим: ВЫКЛ"}'
fi
