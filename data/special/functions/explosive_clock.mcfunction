advancement revoke @s only peter:explosive_clock

execute as @a[nbt={SelectedItem:{id:"minecraft:clock",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run execute at @e[distance=1..20,type=!arrow,type=!wolf,type=!cat,type=!allay,type=!villager,type=!wandering_trader,type=!armor_stand,type=!boat,type=!experience_orb,type=!item_frame,type=!glow_item_frame,type=!item,type=!leash_knot,type=!painting,type=!trident] run summon minecraft:tnt ~ ~ ~

execute as @a[nbt={SelectedItem:{id:"minecraft:clock",count:1,components:{"minecraft:custom_model_data":1}}}] at @s run effect give @s resistance 1 255 true