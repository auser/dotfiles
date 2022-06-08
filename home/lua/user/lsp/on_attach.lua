return function(client, bufnr)
  if client.name == "sqls" then
    require("sqls").on_attach(client, bufnr)
  end

  if client.name == "solargraph" then
    client.server_capabilities.document_formatting = false
  end
end
