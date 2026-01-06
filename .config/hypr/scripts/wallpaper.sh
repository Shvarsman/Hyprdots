#!/bin/bash

# Путь к папке с обоями
DIR=$HOME/Wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

# Меняем обои с эффектом (например, random или wave)
swww img ${DIR}/${RANDOMPICS} --transition-type random --transition-fps 60 --transition-step 90
