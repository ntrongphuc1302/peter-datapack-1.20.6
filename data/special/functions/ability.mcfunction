# Invisible
scoreboard objectives add sneak minecraft.custom:minecraft.sneak_time

execute as @a[nbt={Inventory:[{Slot:103b,id:"minecraft:glass",components:{"minecraft:custom_model_data":1}}]}] run execute as @e[scores={sneak=1..}] run effect give @s minecraft:invisibility 1 0 true

execute as @e[scores={sneak=1..}] run effect give @s minecraft:invisibility 1 0 true

scoreboard players set @a sneak 0