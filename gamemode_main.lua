PLUGIN = {}

function Initialize(Plugin)
  PLUGIN = Plugin
  Plugin:SetName(g_PluginInfo.Name)
  Plugin:SetVersion(1)
  
  PluginManager = cRoot:Get():GetPluginManager()
  cPluginManager:AddHook(cPluginManager.HOOK_ENTITY_CHANGED_WORLD, OnEntityChangedWorld)
  
  LOG("Initialised " .. g_PluginInfo.Name .. " v." .. g_PluginInfo.Version)
  return true
end

function OnDisable()
  LOG(PLUGIN:GetName() .. " v" .. g_PluginInfo.Version .. " is shutting down...")
end

function OnEntityChangedWorld(Entity, World)
  if Entity:IsPlayer() then
    local world = Entity:GetWorld()
    Entity:SetGameMode(world:GetGameMode())
    Entity:SendMessage(cChatColor.Yellow .. "Your gamemode has been updated to match world!")
  end
end