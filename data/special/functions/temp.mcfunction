# Lightning Cast
execute unless entity @e[tag=dummy] run summon armor_stand ~ ~ ~ {Tags:["dummy"]}

execute at @a run tp @e[tag=dummy] ^ ^ ^170

scoreboard objectives add lightningcast minecraft.used:minecraft.carrot_on_a_stick

execute at @e[scores={lightningcast=1..}] run summon armor_stand ~ ~1 ~ {Tags:["dummy2"],Invisible:1b}

scoreboard players reset @a lightningcast

# dup to make it go faster
execute as @e[tag=dummy2] at @s if block ~ ~ ~ air run execute unless entity @e[distance=..1,type=!player,type=!armor_stand] run tp @s ^ ^ ^1 facing entity @e[tag=dummy,limit=1]
execute as @e[tag=dummy2] at @s if block ~ ~ ~ air run execute unless entity @e[distance=..1,type=!player,type=!armor_stand] run tp @s ^ ^ ^1 facing entity @e[tag=dummy,limit=1]
execute as @e[tag=dummy2] at @s if block ~ ~ ~ air run execute unless entity @e[distance=..1,type=!player,type=!armor_stand] run tp @s ^ ^ ^1 facing entity @e[tag=dummy,limit=1]
execute as @e[tag=dummy2] at @s if block ~ ~ ~ air run execute unless entity @e[distance=..1,type=!player,type=!armor_stand] run tp @s ^ ^ ^1 facing entity @e[tag=dummy,limit=1]

execute at @e[tag=dummy2] unless block ~ ~ ~ air run summon lightning_bolt ~ ~ ~

kill @e[tag=dummy2]


# execute as @a[nbt={FallFlying:1b}] anchored eyes at @s run particle end_rod ^ ^ ^3


# scoreboard objectives add health health "Health"
# bossbar add id:name "PeterKing"
# bossbar set id:name max 20
# bossbar set id:name style notched_20
# bossbar set id:name color red
# bossbar set players @a
execute store bossbar id:name value run scoreboard players get playerName health