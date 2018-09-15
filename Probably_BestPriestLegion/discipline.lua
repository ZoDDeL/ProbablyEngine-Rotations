-- Best Discipline Priest Legion 7.1.5
-- Custom Discipline Priest Rotation
-- by ZoDDeL

ProbablyEngine.library.register('coreHealing', {
  needsHealing = function(percent, count)
    return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
  end,
  needsDispelled = function(spell)
    for unit,_ in pairs(ProbablyEngine.raid.roster) do
      if UnitDebuff(unit, spell) then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end
  end,
})



ProbablyEngine.rotation.register_custom(256, "BDPL_0.6", {

--In Combat


--hotkeys
{ "586", "modifier.lcontrol", }, --fade
{ "8122", "modifier.lcontrol", }, --psych scream
{ "527", "modifier.lshift","target"}, --dispel target
{ "62618", "modifier.lalt", "ground"}, --power word barrier


--buffs

{ "211681",{ --power word fortitude pvp buff
	"!player.buff(211681)",
	"modifier.cooldowns",},
"player"},


--dispell PVP

{"527", "player.dispellable(527)","player"}, --dispell self


--unstuck human racial

{"59752", "player.state.stun"}, --every man for himself





--Survival

{"33206",{ --Pain Suppression
	"!player.buff(33206)",
	"player.health <= 40"},
"player"},


{ "#5512", { --Healthstone
	"player.health <= 40",
}},


{"47536", "player.health <= 50"}, --rapture

{"17",{  --Power Word: Shield
	"!player.buff(17)",
	"player.health < 95",},
"player"}, 


{"47540",{ --penance heal
	"player.health <= 60"},
"player"}, 


{"152118",{  --clarity of will
	"!player.moving",
	"!player.buff(152118)",
	"player.health < 90",},
"player"}, 


{"186263",{ --shadow mend
	"!player.moving",
	"player.health <= 70"},
"player"}, 


{"200829",{ --plea
	"player.health <= 85"},
"player"}, 


--tank heal

{"33206",{ --Pain Suppression
	"!tank.buff(33206)",
	"tank.health <= 40",
	"tank.range <= 40"},
"tank"},


{"47536", "tank.health <= 50"}, --rapture


{"17",{  --Power Word: Shield
	"!tank.buff(17)",
	"tank.health < 95",
	"tank.range <= 40"},
"tank"}, 


{"47540",{ --penance heal
	"tank.health <= 60",
	"tank.range <= 35"},
"tank"}, 


{"152118",{  --clarity of will
	"!player.moving",
	"!tank.buff(152118)",
	"tank.health < 90",
	"tank.range <= 40"},
"tank"}, 


{"186263",{ --shadow mend
	"!player.moving",
	"tank.health <= 70",
	"tank.range <= 40"},
"tank"}, 


{"200829",{ --plea
	"tank.health <= 85",
	"tank.range <= 40"},
"tank"}, 


--Heal Rota

{"33206",{ --Pain Suppression
	"!lowest.buff(33206)",
	"!lowest.buff(27827)",
	"lowest.health <= 40",
	"lowest.range <= 40"},
"lowest"},

{"47536", "@coreHealing.needsHealing(75, 3),"}, --rapture


{"17",{  --Power Word: Shield
	"!lowest.buff(17)",
	"!lowest.buff(27827)",
	"lowest.health < 95",
	"lowest.range <= 40"},
"lowest"},  


{"194509",{ --power word radiance
	"!player.moving",
	"@coreHealing.needsHealing(70, 3)",
	"lowest.range <= 40"},
"lowest"}, 
	
--{"204065",{ --shadow covenant
--	"@coreHealing.needsHealing(70, 5)",
--	"lowest.range <= 40"},
--"lowest"}, 


{"47540",{ --penance heal
	"!lowest.buff(27827)",
	"lowest.health <= 60",
	"lowest.range <= 35"},
"lowest"}, 

{"186263",{ --shadow mend
	"!player.moving",
	"!lowest.buff(27827)",
	"lowest.health <= 70",
	"lowest.range <= 40"},
"lowest"}, 

{"200829",{ --plea
	"!player.mana < 30",
	"!lowest.buff(27827)",
	"lowest.health <= 85",
	"lowest.range <= 40"},
"lowest"}, 



--DPS Rota

{"129250",{  --power word solace
	"!target.buff(642)",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"!target.buff(45438)"},
"target"},


{"589",{  --Shadow Word: Pain
	"!target.buff(642)",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"!target.buff(45438)",
	"!target.debuff(589)"},
"target"}, 


{"34433",{  --shadowfiend
	"!target.buff(642)",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"!target.buff(45438)",
	"!target.deathin < 12"},
"target"},


{"207946",{  --lights wrath
	"!player.moving",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"!target.buff(642)",
	"!target.buff(45438)",
	"target.range <= 35",
	"!target.deathin < 3"},
"target"},


{"47540",{  --Penance
	"!target.buff(642)",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"target.range <= 35",
	"!target.buff(45438)"},
"target"},


{"585",{  --Smite
	"!target.buff(642)",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"!target.buff(45438)",
	"target.range <= 35",
	"!player.moving"},
"target"},

},{

--Out of Combat    


{"589",{  --Shadow Word: Pain
	"target.combat",
	"target.enemy",
	"!target.state.disorient",
	"!target.state.incapacitate",
	"!target.state.fear",
	"!target.state.sleep",
	"!target.buff(642)",
	"!target.buff(45438)",
	"!target.debuff(589)"},
"target"}, 


	--Healing OOC Rotation

{"194509",{ --power word radiance
	"!player.moving",
	"@coreHealing.needsHealing(70, 3)"},
"lowest"}, 
	
--{"204065",{ --shadow covenant
--	"@coreHealing.needsHealing(70, 5)"},
--"lowest"}, 


{"47540",{ --penance heal
	"lowest.health <= 60",
	"lowest.range <= 40"},
"lowest"}, 

{"186263",{ --shadow mend
	"!player.moving",
	"lowest.health <= 70",
	"lowest.range <= 40"},
"lowest"}, 

{"200829",{ --plea
	"!player.mana < 30",
	"lowest.health <= 40",
	"lowest.range <= 40"},
"lowest"}, 




  })
