local GuildHi = CreateFrame'Frame'

GuildHi:RegisterEvent'CHAT_MSG_SYSTEM'
GuildHi:RegisterEvent'PLAYER_ENTERING_WORLD'
GuildHi:RegisterEvent'GUILD_ROSTER_UPDATE'
GuildHi:RegisterEvent'PLAYER_GUILD_UPDATE'

GuildHi:SetScript('OnEvent', function(self, event, ...)
  self[event](self, event, ...)
end)

local guild_members = "";
local pattern_friend_online_ss = ".*%[(.+)%]%S*"..string.sub(ERR_FRIEND_ONLINE_SS, 20);
local pattern_friend_offline_s = string.format(ERR_FRIEND_OFFLINE_S, "(.+)");
local pattern_guild_join_s = string.format(ERR_GUILD_JOIN_S, "(.+)");

local function BuildGuildMemberTable()
  local guild_member = {};
  for i = 1, GetNumGuildMembers() do
    guild_member[i] = GetGuildRosterInfo(i);
  end
  guild_members = "|" .. table.concat(guild_member,"|");
end

local function SendGuildChatMessage(msg)
  C_Timer.After(1,function()
    SendChatMessage(msg, "GUILD");
  end);
end

GuildHi.CHAT_MSG_SYSTEM = function(...)
  local _, _, arg1 = ...;

  -- online
  local _, _, member = string.find(arg1, pattern_friend_online_ss);
  if (member ~= nil and string.find(guild_members, "|"..member.."-")) then
    SendGuildChatMessage(string.format(guildhi_string["HI"], member));
    return;
  end

  -- offline
  _, _, member = string.find(arg1, pattern_friend_offline_s);
  if (member ~= nil and string.find(guild_members, "|"..member.."-")) then
    SendGuildChatMessage(string.format(guildhi_string["BYE"], member));
    return;
  end

  -- join guild
  _, _, member = string.find(arg1, pattern_guild_join_s);
  if member ~= nil then
    SendGuildChatMessage(string.format(guildhi_string["WELCOME_JOIN"], member));
    return;
  end
end

GuildHi.GUILD_ROSTER_UPDATE = function(...)
  BuildGuildMemberTable();
end

GuildHi.PLAYER_GUILD_UPDATE = function(...)
  BuildGuildMemberTable();
end