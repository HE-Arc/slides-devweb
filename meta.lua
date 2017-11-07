-- read metadata file into string

local metafile = io.open('src/metadata.yaml', 'r')
local content = metafile:read("*a")
metafile:close()

-- get metadata

local default_meta = pandoc.read(content, 'markdown').meta

return {
  {
    Meta = function(meta)
      -- use default metadata field if it hasn't been defined yet.
      for k, v in pairs(default_meta) do
        if meta[k] == nil then
          meta[k] = v
        end
      end

      return meta
    end,
  }
}
