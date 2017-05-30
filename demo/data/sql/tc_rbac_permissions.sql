#
# RBAC Structure
#
# Current original Roles are:
# 198 Moderator Commands
# 197 GameMaster Commands
# 196 Administrator Commands
#
# 195: Player 0
# 194: Moderator 1
# 193: GameMaster 2
# 192: Administrator 3
#
# custom roles: 100000+
#

# IMPORTANT RULE:  do NOT insert duplicate linked permissions for multiple non-custom roles

#
# EDIT DEFAULT PERMISSIONS
#

# Move to GM level 3 some dangerous commands
UPDATE IGNORE `rbac_linked_permissions` SET `id` = 192 WHERE `id` < 100000 AND `linkedId` IN (
  772, # Command: wp unload
  771, # Command: wp modify
  770, # Command: wp load
  769, # Command: wp event
  768, # Command: wp add
  595, # Command: npc move
  591, # Command: npc set spawntime
  590, # Command: npc set spawndist
  589, # Command: npc set phase
  588, # Command: npc set movetype
  587, # Command: npc set model
  586, # Command: npc set link
  585, # Command: npc set level
  584, # Command: npc set flag
  583, # Command: npc set factionid
  580, # Command: npc set
  579, # Command: npc add follow stop
  578, # Command: npc add follow
  577, # Command: npc add delete item
  576, # Command: npc add delete
  575, # Command: npc add temp
  574, # Command: npc add move
  573, # Command: npc add item
  572, # Command: npc add formation
  571, # Command: npc add
  399, # Command: gobject turn
  397, # Command: gobject set state
  396, # Command: gobject set phase
  395, # Command: gobject set
  393, # Command: gobject move
  391, # Command: gobject delete
  390, # Command: gobject add temp
  389, # Command: gobject add
  370, # Command: event stop
  369, # Command: event start
  532, # Command: unmute
  515, # Command: mute
  597, # Command: npc say
  598, # Command: npc texemote
  599, # Command: npc whisper
  600  # Command: npc yell
);

SET FOREIGN_KEY_CHECKS=0; -- disable temporary FKEY check


#
# Create custom Roles
#

DELETE FROM `rbac_linked_permissions` WHERE `id` >= 100000 OR `linkedId` >= 100000;
DELETE FROM `rbac_permissions` WHERE `id` >= 100000;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
('100011', 'Role: Player'),
('100012', 'Role: Test Player'),
('100013', 'Role: Test GM');

SET FOREIGN_KEY_CHECKS=1; -- re-enable foreign key check

# Add default permissions
# test
DELETE FROM `rbac_default_permissions` WHERE `permissionId` >= 100000;
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES ('0', '100012', -1);
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES ('0', '100011', -1);
INSERT INTO `rbac_default_permissions` (`secId`, `permissionId`, `realmId`) VALUES ('0', '100013', -1);

### TEST SERVER ROLES ###

# [100012] player
INSERT INTO `rbac_linked_permissions` VALUES (100012, 195);  # inheriting from PLAYER
INSERT INTO `rbac_linked_permissions` VALUES (100012, 309);  # Command: debug hostil
INSERT INTO `rbac_linked_permissions` VALUES (100012, 442);  # Command: lookup
INSERT INTO `rbac_linked_permissions` VALUES (100012, 443);  # Command: lookup area
INSERT INTO `rbac_linked_permissions` VALUES (100012, 444);  # Command: lookup creature
INSERT INTO `rbac_linked_permissions` VALUES (100012, 445);  # Command: lookup event
INSERT INTO `rbac_linked_permissions` VALUES (100012, 446);  # Command: lookup faction
INSERT INTO `rbac_linked_permissions` VALUES (100012, 447);  # Command: lookup item
INSERT INTO `rbac_linked_permissions` VALUES (100012, 448);  # Command: lookup itemset
INSERT INTO `rbac_linked_permissions` VALUES (100012, 449);  # Command: lookup object
INSERT INTO `rbac_linked_permissions` VALUES (100012, 450);  # Command: lookup quest
INSERT INTO `rbac_linked_permissions` VALUES (100012, 456);  # Command: lookup spell
INSERT INTO `rbac_linked_permissions` VALUES (100012, 457);  # Command: lookup spell id
INSERT INTO `rbac_linked_permissions` VALUES (100012, 458);  # Command: lookup taxinode
INSERT INTO `rbac_linked_permissions` VALUES (100012, 460);  # Command: lookup title
INSERT INTO `rbac_linked_permissions` VALUES (100012, 461);  # Command: lookup map
INSERT INTO `rbac_linked_permissions` VALUES (100012, 718);  # Command: server
INSERT INTO `rbac_linked_permissions` VALUES (100012, 736);  # Command: server motd


# Special: test realm player
INSERT INTO `rbac_linked_permissions` VALUES (100011, 100012); # inheriting from Player
INSERT INTO `rbac_linked_permissions` VALUES (100011, 291);    # Command: cheat
INSERT INTO `rbac_linked_permissions` VALUES (100011, 294);    # Command: cheat explore
INSERT INTO `rbac_linked_permissions` VALUES (100011, 298);    # Command: cheat taxi
INSERT INTO `rbac_linked_permissions` VALUES (100011, 377);    # Command: go
INSERT INTO `rbac_linked_permissions` VALUES (100011, 378);    # Command: go creature
INSERT INTO `rbac_linked_permissions` VALUES (100011, 442);    # Command: lookup
INSERT INTO `rbac_linked_permissions` VALUES (100011, 447);    # Command: lookup item
INSERT INTO `rbac_linked_permissions` VALUES (100011, 488);    # Command: additem
INSERT INTO `rbac_linked_permissions` VALUES (100011, 489);    # Command: additemset
INSERT INTO `rbac_linked_permissions` VALUES (100011, 287);    # Command: levelup
INSERT INTO `rbac_linked_permissions` VALUES (100011, 554);    # Command: modify money
INSERT INTO `rbac_linked_permissions` VALUES (100011, 737);    # Command: tele
INSERT INTO `rbac_linked_permissions` VALUES (100011, 459);    # Command: lookup tele
INSERT INTO `rbac_linked_permissions` VALUES (100011, 593);    # Command: npcinfo
INSERT INTO `rbac_linked_permissions` VALUES (100011, 796);    # Command: instance getbossstate

# Special: test realm GM
INSERT INTO `rbac_linked_permissions` VALUES (100013, 193);     # inheriting from GM LVL 2
INSERT INTO `rbac_linked_permissions` VALUES (100013, 100011);  # inherit from test player
INSERT INTO `rbac_linked_permissions` VALUES (100013, 498);     # Command: damage
INSERT INTO `rbac_linked_permissions` VALUES (100013, 500);     # Command: die
INSERT INTO `rbac_linked_permissions` VALUES (100013, 795);     # Command: instance setbossstate
INSERT INTO `rbac_linked_permissions` VALUES (100013, 796);     # Command: instance getbossstate
INSERT INTO `rbac_linked_permissions` VALUES (100013, 370);     # Command: event stop
INSERT INTO `rbac_linked_permissions` VALUES (100013, 369);     # Command: event start
INSERT INTO `rbac_linked_permissions` VALUES (100013, 373);     # Command: gm fly
INSERT INTO `rbac_linked_permissions` VALUES (100013, 517);     # Command: pinfo
INSERT INTO `rbac_linked_permissions` VALUES (100013, 513);     # Command: maxskill
INSERT INTO `rbac_linked_permissions` VALUES (100013, 522);     # Command: respawn
INSERT INTO `rbac_linked_permissions` VALUES (100013, 523);     # Command: revive
INSERT INTO `rbac_linked_permissions` VALUES (100013, 526);     # Command: set skill
INSERT INTO `rbac_linked_permissions` VALUES (100013, 558);     # Command: modify rep
INSERT INTO `rbac_linked_permissions` VALUES (100013, 455);     # Command: lookup skill [ can inspect other players skills ]
INSERT INTO `rbac_linked_permissions` VALUES (100013, 556);     # Command: modify phase
INSERT INTO `rbac_linked_permissions` VALUES (100013, 417);     # Command: learn
INSERT INTO `rbac_linked_permissions` VALUES (100013, 418);     # Command: learn all
INSERT INTO `rbac_linked_permissions` VALUES (100013, 419);     # Command: learn all my
INSERT INTO `rbac_linked_permissions` VALUES (100013, 420);     # Command: learn all my class
INSERT INTO `rbac_linked_permissions` VALUES (100013, 421);     # Command: learn all my pettalents
INSERT INTO `rbac_linked_permissions` VALUES (100013, 422);     # Command: learn all my spells
INSERT INTO `rbac_linked_permissions` VALUES (100013, 423);     # Command: learn all my talents
INSERT INTO `rbac_linked_permissions` VALUES (100013, 424);     # Command: learn all gm
INSERT INTO `rbac_linked_permissions` VALUES (100013, 425);     # Command: learn all crafts
INSERT INTO `rbac_linked_permissions` VALUES (100013, 426);     # Command: learn all default
INSERT INTO `rbac_linked_permissions` VALUES (100013, 427);     # Command: learn all lang
INSERT INTO `rbac_linked_permissions` VALUES (100013, 428);     # Command: learn all recipes
INSERT INTO `rbac_linked_permissions` VALUES (100013, 429);     # COmmand: unlearn
INSERT INTO `rbac_linked_permissions` VALUES (100013, 521);     # Command: repairitems
INSERT INTO `rbac_linked_permissions` VALUES (100013, 711);     # Command: reset achievements
INSERT INTO `rbac_linked_permissions` VALUES (100013, 712);     # Command: reset honor
INSERT INTO `rbac_linked_permissions` VALUES (100013, 713);     # Command: reset level
INSERT INTO `rbac_linked_permissions` VALUES (100013, 714);     # Command: reset spells
INSERT INTO `rbac_linked_permissions` VALUES (100013, 715);     # Command: reset stats
INSERT INTO `rbac_linked_permissions` VALUES (100013, 716);     # Command: reset talents
INSERT INTO `rbac_linked_permissions` VALUES (100013, 710);     # Command: reset
INSERT INTO `rbac_linked_permissions` VALUES (100013, 488);     # Command: additem
INSERT INTO `rbac_linked_permissions` VALUES (100013, 489);     # Command: additemset
INSERT INTO `rbac_linked_permissions` VALUES (100013, 231);     # Command: achievement add
INSERT INTO `rbac_linked_permissions` VALUES (100013, 602);     # Command: quest
INSERT INTO `rbac_linked_permissions` VALUES (100013, 603);     # Command: quest add
INSERT INTO `rbac_linked_permissions` VALUES (100013, 604);     # Command: quest complete
INSERT INTO `rbac_linked_permissions` VALUES (100013, 605);     # Command: quest remove
INSERT INTO `rbac_linked_permissions` VALUES (100013, 606);     # Command: quest reward
INSERT INTO `rbac_linked_permissions` VALUES (100013, 777);     # Command: mailbox
INSERT INTO `rbac_linked_permissions` VALUES (100013, 284);     # Command: character rename
INSERT INTO `rbac_linked_permissions` VALUES (100013, 274);     # Command: character customize
INSERT INTO `rbac_linked_permissions` VALUES (100013, 275);     # Command: character changefaction
INSERT INTO `rbac_linked_permissions` VALUES (100013, 276);     # Command: character changerace
INSERT INTO `rbac_linked_permissions` VALUES (100013, 529);     # Command: unaura

