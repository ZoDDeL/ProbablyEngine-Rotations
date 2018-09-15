-- Best Shadow Priest Legion 7.1.5
-- Custom Shadow Priest Rotation
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



ProbablyEngine.rotation.register_custom(258, "BSPL_0.2", {

--In Combat

{ "62618", "modifier.lalt", "ground"}, --mass dispel





--Survival

{ "#5512", { --Healthstone
		"player.health <= 40",
}},


{"15286", "player.health <= 60"}, --vampiric embrace


{"17",{  --Power Word: Shield
	"!player.buff(17)",
	"player.health < 95",},
"player"}, 


{"186263",{ --shadow mend
	"!player.moving",
	"player.health <= 70"},
"player"}, 







--DPS Rota

{"589",{  --Shadow Word: Pain
	"!target.debuff(589)",},
"target"}, 


{"200174",{  --mind bender
	"!target.deathin < 12"},
"target"},

{"34433",{  --shadow fiend
	"!target.deathin < 12"},
"target"},


{"205065",{  --void torrent
	"!player.moving",
	"player.buff(194249)",
	"!target.deathin < 4",
	"!modifier.multitarget",},
"target"},


{"205448",{  --void bolt
	"player.buff(194249)",},
"target"},


{"228260",{  --void eruption
	"!player.moving",
	"!player.buff(194249)",
	"player.insanity >= 65"},
"target"},


{"199911",{  --Shadow Word: death
	"player.insanity <= 70",
	"target.health <= 35",},
"target"}, 


{"8092",{  --mind blast proc shadowy insight
	"player.buff(124430)",},
"target"},


{"34914",{  --vampiric touch
	"!player.moving",
	"!target.debuff(34914)",
	"!target.deathin < 12",
	"!modifier.multitarget",},
"target"},


{"15407",{  --mind flay AOE
	"modifier.multitarget",
	"!player.moving",},
"target"},


{"8092",{  --mind blast
	"!player.moving",
	"!modifier.multitarget",},
"target"},


{"15407",{  --mind flay single filler
	"!player.moving",
	"!modifier.multitarget",},
"target"},


},{

--Out of Combat    

{"232698", "!player.buff(232698)"}, --shadow form


{"589",{  --Shadow Word: Pain
	"target.combat",
	"target.enemy",
	"!target.debuff(589)",},
"target"}, 


	--Healing OOC Rotation


{"186263",{ --shadow mend
	"!player.moving",
	"player.health <= 70"},
"player"}, 




  })
