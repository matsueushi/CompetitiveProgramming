function solve(d)
    t = 'a'
    ld = Dict(k => length(v) for (k, v) in pairs(d))
    xd = Dict(k => 0 for k in keys(d))
    while true
        xd[t] == ld[t] && return uppercase(t)
        xd[t] += 1
        t = d[t][xd[t]]
    end
end

function main()
    d = Dict{Char,String}()
    d['a'] = readline()
    d['b'] = readline()
    d['c'] = readline()
    println(solve(d))
end

main()
