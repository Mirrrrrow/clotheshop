local currentVersion = GetResourceMetadata(cache.resource, 'version', 0)
if currentVersion == '0.0.0' then
    warn(("You are running an unstable version of '%s'. Please do not use this in production."):format(cache
        .resource))
end
