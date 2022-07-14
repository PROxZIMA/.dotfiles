return function()
    for name in pairs(package.loaded) do
        package.loaded[name] = nil
    end
    dofile(vim.env.MYVIMRC)
end
