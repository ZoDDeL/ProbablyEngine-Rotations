-- Best Holy Priest Legion 7.1.5
-- Custom Holy Priest Rotation
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



ProbablyEngine.rotation.register_custom(257, "BHPL_0.4", {

--In Combat

{ "34861", "modifier.lalt", "ground"}, --holy word sanctify
{ "527", "modifier.lshift","target"}, --dispel target

--dispell PVP

{"527", "player.dispellable(527)","player"}, --dispell self


--unstuck human racial

{"59752", "player.state.stun"}, --every man for himself




--Survival

{"47788",{ --guardian spirit
	"!player.buff(47788)",
	"!player.buff(27827)",
	"player.health <= 40"},
"player"},


{ "#5512", { --Healthstone
	"player.health <= 40",
}},


{"208065",{ --light of tuure
	"!player.buff(208065)",
	"!player.buff(27827)",
	"player.health <= 50"},
"player"},


{"19236",{ --desperate prayer
	"!player.buff(27827)",
	"player.health <= 50"
}},


{"2050",{ --holy word serenity
	"!player.buff(27827)",
	"player.health <= 60"},
"player"}, 


{"2061",{ --flash heal
	"!player.moving",
	"!player.buff(27827)",
	"player.health <= 60"},
"player"}, 


{"139",{  --renew
	"!player.buff(139)",
	"!player.buff(27827)",
	"player.health < 95"},
"player"}, 


{"33076",{  --prayer of mending
	"!player.moving",
	"!player.buff(41635)",
	"!player.buff(27827)",
	"player.health < 90"},
"player"}, 


{"2060",{ --heal
	"!player.moving",
	"!player.buff(27827)",
	"player.health <= 80"},
"player"},


--tank heal

{"47788",{ --guardian spirit
	"!tank.buff(47788)",
	"tank.health <= 40"},
"tank"},


{"208065",{ --light of tuure
	"!tank.buff(208065)",
	"tank.health <= 50"},
"tank"},


{"2050",{ --holy word serenity
	"tank.health <= 60"},
"tank"}, 


{"2061",{ --flash heal
	"!player.moving",
	"tank.health <= 60"},
"tank"}, 


{"139",{  --renew
	"!tank.buff(139)",
	"tank.health < 95"},
"tank"}, 


{"33076",{  --prayer of mending
	"!player.moving",
	"!tank.buff(41635)",
	"tank.health < 90"},
"tank"}, 


{"2060",{ --heal
	"!player.moving",
	"tank.health <= 80"},
"tank"}, 


--Heal Rota

{"64901",{ --symbol of hope
	"@coreHealing.needsHealing(50, 5)",
	"player.mana < 50",
}}, 


{"64843",{ --divine hymn
	"@coreHealing.needsHealing(60, 5)",
}}, 


{"596",{ --prayer of healing
	"!player.moving",
	"!lowest.buff(27827)",
	"@coreHealing.needsHealing(70, 5)",
	"lowest.range <= 40"},
"lowest"}, 


{"2050",{ --holy word serenity
	"lowest.health <= 60",
	"!lowest.buff(27827)"},
"lowest"}, 


{"2061",{ --flash heal
	"!player.moving",
	"!lowest.buff(27827)",
	"lowest.health <= 60"},
"lowest"}, 


{"139",{  --renew
	"!lowest.buff(139)",
	"!lowest.buff(27827)",
	"lowest.health < 95"},
"lowest"}, 


{"33076",{  --prayer of mending
	"!player.moving",
	"!lowest.buff(41635)",
	"!lowest.buff(27827)",
	"lowest.health < 90"},
"lowest"}, 


{"2060",{ --heal
	"!player.moving",
	"!lowest.buff(27827)",
	"lowest.health <= 80"},
"lowest"}, 




--DPS Rota
{"88625"},  --holy word chastise

{"14914",{  --holy fire
	"!target.debuff(14914)"},
"target"}, 

{ "132157", { --holy nova
	"target.range <= 12",
	"modifier.multitarget",
}},

{"585",{  --Smite 
	"!player.moving"},
"target"},


},{


--Out of Combat    

{"14914",{  --holy fire
	"target.combat",
	"target.enemy",
	"!target.debuff(14914)"},
"target"}, 


--Healing OOC Rotation

{"596",{ --prayer of healing
	"!player.moving",
	"@coreHealing.needsHealing(70, 5)",
	"lowest.range <= 40"},
"lowest"}, 


{"2050",{ --holy word serenity
	"!lowest.buff(27827)",
	"lowest.health <= 60"},
"lowest"}, 


{"2060",{ --heal
	"!player.moving",
	"!lowest.buff(27827)",
	"lowest.health <= 80"},
"lowest"}, 





  })
